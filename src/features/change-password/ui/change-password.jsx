import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
const schema = z.object({ old: z.string().min(1, 'Введите пароль'), new: z.string().min(6, 'Мин 6 символов'), confirm: z.string() }).refine(d => d.new === d.confirm, { message: 'Не совпадают', path: ['confirm'] });
export const ChangePassword = () => {
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(schema) });
  return (
    <form onSubmit={handleSubmit(() => alert('Пароль изменен!'))} style={{ maxWidth: '400px' }}>
      <Input label="Старый пароль" type="password" register={register('old')} error={errors.old} />
      <Input label="Новый пароль" type="password" register={register('new')} error={errors.new} />
      <Input label="Новый пароль еще раз" type="password" register={register('confirm')} error={errors.confirm} />
      <Button type="submit">Сохранить</Button>
    </form>
  );
};
