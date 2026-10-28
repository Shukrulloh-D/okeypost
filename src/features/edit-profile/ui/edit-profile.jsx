import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { useState } from 'react';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { SuccessModal } from '@/shared/ui/success-modal';
import { useAuthStore } from '@/shared/store/auth-store';

const schema = z.object({
  name: z.string().min(2, 'Минимум 2 символа'),
  surname: z.string().min(2, 'Минимум 2 символа'),
  phone: z.string().min(10, 'Некорректный телефон'),
  email: z.string().email('Некорректный email'),
  address: z.string().optional(),
  login: z.string().optional(),
});

export const EditProfile = () => {
  const [showSuccess, setShowSuccess] = useState(false);
  const updateProfile = useAuthStore((s) => s.updateProfile);
  const { register, handleSubmit, formState: { errors } } = useForm({
    resolver: zodResolver(schema),
    defaultValues: { name: 'Dmitro', surname: 'Karlov', phone: '+38 098 898 99 66', email: 'dmitro.karlov@gmail.com', address: 'Москва, Проспект Гоголя, 30/98', login: 'dmitro.karlov' }
  });

  const onSubmit = (data) => {
    updateProfile({ name: data.name });
    setShowSuccess(true);
  };

  return (
    <>
      <div className="flex gap-8 items-start">
        <div style={{flexShrink: 0}}>
          <img src="/images/profile/avatar.png" alt="Avatar" style={{width: 180, height: 180, borderRadius: 12, objectFit: 'cover', background: '#eee'}} onError={(e)=>e.target.style.background='#ddd'} />
          <Button variant="outline" className="mt-4" style={{width: '100%'}}>Изменить фото</Button>
        </div>
        <form onSubmit={handleSubmit(onSubmit)} style={{flex: 1}}>
          <div className="grid-2">
            <Input label="Имя:" register={register('name')} error={errors.name} />
            <Input label="Фамилия:" register={register('surname')} error={errors.surname} />
            <Input label="Адрес:" register={register('address')} />
            <Input label="Логин:" register={register('login')} />
            <Input label="Номер телефона:" register={register('phone')} error={errors.phone} />
            <Input label="E-mail:" register={register('email')} error={errors.email} />
          </div>
          <label className="flex items-center gap-2 text-sm mt-2 mb-6">
            <input type="checkbox" style={{width: 18, height: 18}} /> Подписаться на рассылку
          </label>
          <Button type="submit">Сохранить</Button>
        </form>
      </div>
      <SuccessModal isOpen={showSuccess} onClose={() => setShowSuccess(false)} title="Профиль обновлен!" message="Ваши данные успешно сохранены." />
    </>
  );
};
