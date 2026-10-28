import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { useState } from 'react';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { SuccessModal } from '@/shared/ui/success-modal';

const schema = z.object({
  old: z.string().min(1, 'Введите старый пароль'),
  new: z.string().min(6, 'Минимум 6 символов'),
  confirm: z.string(),
}).refine((d) => d.new === d.confirm, { message: 'Пароли не совпадают', path: ['confirm'] });

export const ChangePassword = () => {
  const [showSuccess, setShowSuccess] = useState(false);
  const { register, handleSubmit, reset, formState: { errors } } = useForm({ resolver: zodResolver(schema) });

  const onSubmit = () => { setShowSuccess(true); reset(); };

  return (
    <>
      <div className="flex gap-8 items-start">
        <div style={{flexShrink: 0}}>
          <img src="/images/profile/avatar.png" alt="Avatar" style={{width: 180, height: 180, borderRadius: 12, objectFit: 'cover', background: '#eee'}} onError={(e)=>e.target.style.background='#ddd'} />
        </div>
        <form onSubmit={handleSubmit(onSubmit)} style={{flex: 1, maxWidth: 500}}>
          <Input label="Старый пароль:" type="password" register={register('old')} error={errors.old} placeholder="Введите текущий пароль" />
          <Input label="Новый пароль:" type="password" register={register('new')} error={errors.new} placeholder="Минимум 6 символов" />
          <Input label="Новый пароль еще раз:" type="password" register={register('confirm')} error={errors.confirm} placeholder="Повторите пароль" />
          <Button type="submit" className="mt-2">Сохранить</Button>
        </form>
      </div>
      <SuccessModal isOpen={showSuccess} onClose={() => setShowSuccess(false)} title="Пароль изменен!" message="Используйте новый пароль при следующем входе." />
    </>
  );
};
