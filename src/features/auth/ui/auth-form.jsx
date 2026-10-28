import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { useNavigate, Link } from 'react-router-dom';
import { useAuthStore } from '@/shared/store/auth-store';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
const schema = z.object({ email: z.string().email('Неверный email'), password: z.string().min(6, 'Мин 6 символов') });
export const AuthForm = ({ isRegister }) => {
  const login = useAuthStore((s) => s.login);
  const navigate = useNavigate();
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(schema) });
  const onSubmit = (data) => { login({ name: 'Дмитрий', email: data.email }); navigate('/profile'); };
  return (
    <form onSubmit={handleSubmit(onSubmit)} style={{ background: '#fff', padding: '40px', borderRadius: '16px', maxWidth: '450px', margin: '0 auto', boxShadow: '0 10px 30px rgba(0,0,0,0.05)' }}>
      <h2 className="title-h2 text-center mb-8">{isRegister ? 'Регистрация' : 'Вход в личный кабинет'}</h2>
      <Input label="Ваш email" placeholder="test@mail.com" register={register('email')} error={errors.email} />
      <Input label="Ваш пароль" type="password" placeholder="******" register={register('password')} error={errors.password} />
      <Button type="submit" style={{ width: '100%' }}>{isRegister ? 'Создать аккаунт' : 'Войти'}</Button>
      <div className="mt-4 text-center">
        {!isRegister && <Link to="/register" style={{color: 'var(--primary-blue)', fontSize: 14}}>Нет аккаунта? Зарегистрироваться</Link>}
        {isRegister && <Link to="/login" style={{color: 'var(--primary-blue)', fontSize: 14}}>Уже есть аккаунт? Войти</Link>}
      </div>
    </form>
  );
}; 
