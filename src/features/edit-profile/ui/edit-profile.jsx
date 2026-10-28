import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
const schema = z.object({ name: z.string().min(2, 'Мин 2 символа'), phone: z.string().min(10, 'Мин 10 цифр') });
export const EditProfile = () => {
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(schema) });
  return (
    <form onSubmit={handleSubmit(() => alert('Сохранено'))} style={{ maxWidth: '500px' }}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px' }}>
        <Input label="Имя" register={register('name')} error={errors.name} />
        <Input label="Фамилия" register={register('surname')} />
        <Input label="Адрес" register={register('address')} />
        <Input label="Город" register={register('city')} />
        <Input label="Телефон" register={register('phone')} error={errors.phone} />
        <Input label="E-mail" register={register('email')} />
      </div>
      <Button type="submit" className="mt-4">Сохранить</Button>
    </form>
  );
};
