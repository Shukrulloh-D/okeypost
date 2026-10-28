import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { useNavigate } from 'react-router-dom';
import { useAuthStore } from '@/shared/store/auth-store';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { X } from 'lucide-react';
import { useToastStore } from '@/shared/ui/toast';
import './auth-page.css';

const loginSchema = z.object({ email: z.string().email('Неверный email'), password: z.string().min(6, 'Мин 6 символов') });

export default function AuthPage() {
  const [mode, setMode] = useState('login');
  const login = useAuthStore((s) => s.login);
  const addToast = useToastStore((s) => s.addToast);
  const navigate = useNavigate();
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(loginSchema) });

  const onLogin = (data) => {
    login({ name: 'Dmitro', email: data.email });
    addToast(`Добро пожаловать, ${data.email}!`, 'success');
    navigate('/profile');
  };

  return (
    <div className="auth-overlay">
      <div className="auth-modal">
        <button className="close-btn" onClick={() => navigate('/')}><X size={24}/></button>

        {mode === 'login' && (
          <form onSubmit={handleSubmit(onLogin)}>
            <h2 className="title-h2 text-center mb-8">Выполните вход в ваш личный кабинет</h2>
            <Input label="Номер телефона" placeholder="+7 (999) 999-99-99" register={register('phone')} />
            <Input label="Ваш email" placeholder="test@mail.com" register={register('email')} error={errors.email} />
            <Input label="Ваш пароль" type="password" placeholder="******" register={register('password')} error={errors.password} />
            <a href="#" className="text-primary-green text-sm block mb-6" onClick={(e)=>{e.preventDefault(); setMode('recovery')}}>Восстановить пароль</a>
            <Button type="submit" style={{width: '100%'}}>Войти</Button>
            <p className="text-center mt-6 text-sm">Нет аккаунта? <a href="#" className="text-primary-blue" onClick={(e)=>{e.preventDefault(); setMode('register')}}>Зарегистрироваться</a></p>
          </form>
        )}

        {mode === 'recovery' && (
          <form onSubmit={(e)=>{e.preventDefault(); addToast('Инструкция отправлена на email', 'success'); setMode('sms')}}>
            <h2 className="title-h2 text-center mb-4">Восстановление пароля</h2>
            <p className="text-center text-muted text-sm mb-8">Введите Email, и мы отправим инструкцию.</p>
            <Input label="Ваш email" placeholder="test@mail.com" />
            <Button type="submit" style={{width: '100%'}}>Восстановить</Button>
            <p className="text-center mt-6 text-sm"><a href="#" className="text-primary-blue" onClick={(e)=>{e.preventDefault(); setMode('login')}}>Вернуться к входу</a></p>
          </form>
        )}

        {mode === 'sms' && (
          <form onSubmit={(e)=>{e.preventDefault(); setMode('login')}}>
            <h2 className="title-h2 text-center mb-4">Введите код из СМС</h2>
            <Input label="Код из СМС" placeholder="0000" />
            <Button type="submit" style={{width: '100%'}}>Подтвердить</Button>
          </form>
        )}

        {mode === 'register' && (
          <form onSubmit={(e)=>{e.preventDefault(); addToast('Аккаунт создан!', 'success'); navigate('/profile')}}>
            <h2 className="title-h2 text-center mb-4">Начните совершать покупки</h2>
            <Input label="Имя" placeholder="Иван" />
            <Input label="Фамилия" placeholder="Иванов" />
            <Input label="Email" placeholder="test@mail.com" />
            <div className="flex gap-2 items-start mt-4">
              <input type="checkbox" style={{marginTop: 4, width: 16, height: 16}}/>
              <p className="text-xs text-muted">Я согласен на обработку персональных данных.</p>
            </div>
            <Button type="submit" style={{width: '100%', marginTop: 24}}>Получить адрес в UK</Button>
            <p className="text-center mt-6 text-sm">Уже есть аккаунт? <a href="#" className="text-primary-blue" onClick={(e)=>{e.preventDefault(); setMode('login')}}>Войти</a></p>
          </form>
        )}
      </div>
    </div>
  );
}
