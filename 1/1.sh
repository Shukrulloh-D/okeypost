#!/bin/bash

echo "🚀 Создаем проект OkeyPost (React + FSD + Forms)..."

# 1. Инициализация Vite

npm install react-router-dom zustand react-hook-form zod @hookform/resolvers lucide-react
npm install

# 2. Структура папок (FSD)
mkdir -p src/app/{router,styles,layouts}
mkdir -p src/pages/{home-page,login-page,register-page,profile-page,create-parcel-page,orders-page}
mkdir -p src/widgets/{header,footer,hero-banner}
mkdir -p src/features/{login-form,register-form,parcel-form,order-filter}
mkdir -p src/entities/{order-row,tariff-card,faq-item}
mkdir -p src/shared/{ui/button,ui/input,ui/select,store,mock,assets}

# 3. Глобальные стили (Цвета из твоих скринов)
cat > src/app/styles/global.css << 'END'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

:root {
  --bg-main: #F5F7FA;
  --bg-card: #FFFFFF;
  --primary-blue: #40B8EA;
  --primary-purple: #5B52A3;
  --primary-green: #00B33B;
  --text-main: #1A1A1A;
  --text-muted: #8A8A8A;
  --border: #E0E0E0;
  --font: 'Inter', sans-serif;
}

* { box-sizing: border-box; margin: 0; padding: 0; }
body { background: var(--bg-main); font-family: var(--font); color: var(--text-main); -webkit-font-smoothing: antialiased; }
a { text-decoration: none; color: inherit; }
ul { list-style: none; }
button { cursor: pointer; font-family: inherit; border: none; background: none; }

.container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
.text-center { text-align: center; }
.mt-4 { margin-top: 16px; } .mt-8 { margin-top: 32px; } .mb-4 { margin-bottom: 16px; } .mb-8 { margin-bottom: 32px; }
.title-h1 { font-size: 36px; font-weight: 700; }
.title-h2 { font-size: 24px; font-weight: 700; }
.text-muted { color: var(--text-muted); font-size: 14px; }
END

# 4. Zustand (Стейт авторизации)
cat > src/shared/store/auth-store.js << 'END'
import { create } from 'zustand';
import { persist } from 'zustand/middleware';

export const useAuthStore = create(
  persist(
    (set) => ({
      user: null,
      isAuth: false,
      login: (userData) => set({ user: userData, isAuth: true }),
              logout: () => set({ user: null, isAuth: false }),
    }),
    { name: 'okeypost-auth' } // Сохраняет юзера в localStorage
  )
);
END

# 5. UI-Кит (То, что будет юзать твой друг)
cat > src/shared/ui/button/button.jsx << 'END'
import './button.css';
export const Button = ({ children, variant = 'primary', className = '', ...props }) => (
  <button className={`btn btn-${variant} ${className}`} {...props}>{children}</button>
);
END
cat > src/shared/ui/button/button.css << 'END'
.btn { padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; transition: 0.2s; display: inline-flex; align-items: center; justify-content: center; gap: 8px; }
.btn-primary { background: var(--primary-green); color: #fff; }
.btn-primary:hover { background: #009933; }
.btn-outline { border: 1px solid var(--primary-blue); color: var(--primary-blue); background: transparent; }
.btn-outline:hover { background: #e6f7ff; }
.btn-blue { background: var(--primary-blue); color: #fff; }
END
echo "export * from './button';" > src/shared/ui/button/index.js

cat > src/shared/ui/input/input.jsx << 'END'
import './input.css';
export const Input = ({ label, error, register, ...props }) => (
  <div className="input-group">
  {label && <label>{label}</label>}
  <input className={error ? 'error' : ''} {...register} {...props} />
  {error && <span className="error-text">{error.message}</span>}
  </div>
);
END
cat > src/shared/ui/input/input.css << 'END'
.input-group { display: flex; flex-direction: column; gap: 6px; margin-bottom: 16px; }
.input-group label { font-size: 14px; font-weight: 500; color: var(--text-main); }
.input-group input { padding: 12px 16px; border: 1px solid var(--border); border-radius: 8px; font-size: 14px; outline: none; transition: 0.2s; background: #fff; }
.input-group input:focus { border-color: var(--primary-blue); box-shadow: 0 0 0 3px rgba(64, 184, 234, 0.1); }
.input-group input.error { border-color: red; }
.error-text { color: red; font-size: 12px; }
END
echo "export * from './input';" > src/shared/ui/input/index.js

# 6. LAYOUTS и ROUTER (С защитой)
cat > src/app/layouts/main-layout.jsx << 'END'
import { Outlet } from 'react-router-dom';
import { Header } from '@/widgets/header';
import { Footer } from '@/widgets/footer';

export const MainLayout = () => (
  <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh' }}>
  <Header />
  <main style={{ flex: 1 }}><Outlet /></main>
  <Footer />
  </div>
);
END

# Защищенный роут
cat > src/app/router/protected-route.jsx << 'END'
import { Navigate, Outlet } from 'react-router-dom';
import { useAuthStore } from '@/shared/store/auth-store';

export const ProtectedRoute = () => {
  const isAuth = useAuthStore((state) => state.isAuth);
  return isAuth ? <Outlet /> : <Navigate to="/login" replace />;
};
END

cat > src/app/router/index.jsx << 'END'
import { createBrowserRouter } from 'react-router-dom';
import { MainLayout } from '../layouts/main-layout';
import { ProtectedRoute } from './protected-route';
import { HomePage } from '@/pages/home-page';
import { LoginPage } from '@/pages/login-page';
import { ProfilePage } from '@/pages/profile-page';
import { CreateParcelPage } from '@/pages/create-parcel-page';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <MainLayout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: 'login', element: <LoginPage /> },
      {
        element: <ProtectedRoute />, // Только для авторизованных
        children: [
          { path: 'profile', element: <ProfilePage /> },
          { path: 'create-parcel', element: <CreateParcelPage /> },
        ]
      }
    ]
  }
]);
END

# 7. ТВОЯ РАБОТА: Сложные формы (RHF + Zod)

# --- ФОРМА ВХОДА ---
cat > src/features/login-form/ui/login-form.jsx << 'END'
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { useNavigate } from 'react-router-dom';
import { useAuthStore } from '@/shared/store/auth-store';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import './login-form.css';

const schema = z.object({
  email: z.string().email('Некорректный email'),
                        password: z.string().min(6, 'Минимум 6 символов'),
});

export const LoginForm = () => {
  const login = useAuthStore((state) => state.login);
  const navigate = useNavigate();
  const { register, handleSubmit, formState: { errors, isSubmitting } } = useForm({
    resolver: zodResolver(schema),
  });
  
  const onSubmit = async (data) => {
    await new Promise(res => setTimeout(res, 1000)); // Имитация API
    login({ name: 'Дмитрий', email: data.email });
    navigate('/profile');
  };
  
  return (
    <form className="login-form" onSubmit={handleSubmit(onSubmit)}>
    <h2 className="title-h2 text-center mb-8">Вход в личный кабинет</h2>
    <Input label="Ваш email" placeholder="test@mail.com" register={register('email')} error={errors.email} />
    <Input label="Ваш пароль" type="password" placeholder="******" register={register('password')} error={errors.password} />
    <Button type="submit" disabled={isSubmitting} style={{ width: '100%' }}>
    {isSubmitting ? 'Загрузка...' : 'Войти'}
    </Button>
    </form>
  );
};
END
cat > src/features/login-form/ui/login-form.css << 'END'
.login-form { background: #fff; padding: 40px; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); max-width: 400px; margin: 0 auto; }
END
echo "export * from './ui/login-form';" > src/features/login-form/index.js

# --- СЛОЖНАЯ ФОРМА: СОЗДАНИЕ ПОСЫЛКИ ---
cat > src/features/parcel-form/ui/parcel-form.jsx << 'END'
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import './parcel-form.css';

const schema = z.object({
  trackNumber: z.string().min(5, 'Минимум 5 символов'),
                        weight: z.string().min(1, 'Укажите вес'),
                        description: z.string().min(10, 'Опишите посылку (мин 10 символов)'),
                        agree: z.boolean().refine(val => val === true, 'Вы должны согласиться с правилами'),
});

export const ParcelForm = () => {
  const { register, handleSubmit, formState: { errors, isSubmitting } } = useForm({
    resolver: zodResolver(schema),
  });
  
  const onSubmit = async (data) => {
    await new Promise(res => setTimeout(res, 1000));
    alert('Посылка успешно создана!');
  };
  
  return (
    <form className="parcel-form" onSubmit={handleSubmit(onSubmit)}>
    <h2 className="title-h2 mb-8">Создание посылки</h2>
    <div className="form-row">
    <Input label="Трек-номер" placeholder="UK123456789" register={register('trackNumber')} error={errors.trackNumber} />
    <Input label="Вес (кг)" type="number" placeholder="1.5" register={register('weight')} error={errors.weight} />
    </div>
    
    <div className="input-group">
    <label>Описание посылки</label>
    <textarea className={errors.description ? 'error' : ''} {...register('description')} rows="4" placeholder="Что внутри?"></textarea>
    {errors.description && <span className="error-text">{errors.description.message}</span>}
    </div>
    
    <div className="checkbox-group">
    <input type="checkbox" id="agree" {...register('agree')} />
    <label htmlFor="agree">Я согласен с правилами сервиса и таможенными нормами</label>
    </div>
    {errors.agree && <span className="error-text">{errors.agree.message}</span>}
    
    <Button type="submit" disabled={isSubmitting} className="mt-4">
    {isSubmitting ? 'Отправка...' : 'Создать посылку'}
    </Button>
    </form>
  );
};
END
cat > src/features/parcel-form/ui/parcel-form.css << 'END'
.parcel-form { background: #fff; padding: 32px; border-radius: 16px; }
.form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
.checkbox-group { display: flex; align-items: center; gap: 10px; margin: 16px 0; font-size: 14px;}
.checkbox-group input { width: 18px; height: 18px; }
textarea { width: 100%; padding: 12px; border: 1px solid var(--border); border-radius: 8px; font-family: inherit; }
textarea.error { border-color: red; }
END
echo "export * from './ui/parcel-form';" > src/features/parcel-form/index.js


# 8. СТРАНИЦЫ (Твои и Друга)
cat > src/pages/login-page/ui/login-page.jsx << 'END'
import { LoginForm } from '@/features/login-form';
export default function LoginPage() {
  return <div className="container mt-8"><LoginForm /></div>;
}
END
echo "export { default as LoginPage } from './ui/login-page';" > src/pages/login-page/index.js

cat > src/pages/profile-page/ui/profile-page.jsx << 'END'
import { useAuthStore } from '@/shared/store/auth-store';
import { Button } from '@/shared/ui/button';
import { useNavigate } from 'react-router-dom';

export default function ProfilePage() {
  const { user, logout } = useAuthStore();
  const navigate = useNavigate();
  
  const handleLogout = () => { logout(); navigate('/'); };
  
  return (
    <div className="container mt-8">
    <h1 className="title-h1">Личный кабинет</h1>
    <p className="mt-4">Привет, {user?.name}!</p>
    <div className="mt-4" style={{ display: 'flex', gap: '16px' }}>
    <Button onClick={() => navigate('/create-parcel')}>Создать посылку</Button>
    <Button variant="outline" onClick={handleLogout}>Выйти</Button>
    </div>
    </div>
  );
}
END
echo "export { default as ProfilePage } from './ui/profile-page';" > src/pages/profile-page/index.js

cat > src/pages/create-parcel-page/ui/create-parcel-page.jsx << 'END'
import { ParcelForm } from '@/features/parcel-form';
export default function CreateParcelPage() {
  return <div className="container mt-8"><ParcelForm /></div>;
}
END
echo "export { default as CreateParcelPage } from './ui/create-parcel-page';" > src/pages/create-parcel-page/index.js

# 9. ЗАГЛУШКИ ДЛЯ ДРУГА (Пустые страницы, чтобы он верстал)
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
export default function HomePage() {
  return (
    <div className="container mt-8">
    {/* TODO для друга: Здесь нужно сверстать Hero-баннер из Figma (синий градиент) */}
    <div style={{ background: 'linear-gradient(90deg, #5B52A3, #40B8EA)', padding: '60px', borderRadius: '24px', color: '#fff' }}>
    <h1 className="title-h1">Доставка товаров из Великобритании в Россию</h1>
    <p style={{ marginTop: '16px', marginBottom: '32px' }}>Начните экономить до 80% на шоппинге</p>
    <Button>Получить адрес в UK</Button>
    </div>
    </div>
  );
}
END
echo "export { default as HomePage } from './ui/home-page';" > src/pages/home-page/index.js

# 10. Header & Footer (Заглушки)
cat > src/widgets/header/ui/header.jsx << 'END'
import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import { useAuthStore } from '@/shared/store/auth-store';

export default function Header() {
  const isAuth = useAuthStore((state) => state.isAuth);
  return (
    <header style={{ background: '#fff', borderBottom: '1px solid #E0E0E0', padding: '16px 0' }}>
    <div className="container" style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
    <Link to="/" style={{ fontSize: '24px', fontWeight: 'bold', color: 'var(--primary-blue)' }}>OkeyPost</Link>
    <nav style={{ display: 'flex', gap: '24px' }}>
    {/* TODO для друга: Сделать красивое меню */}
    <Link to="/">Как покупать</Link>
    <Link to="/">Распродажи</Link>
    <Link to="/">Цены</Link>
    </nav>
    <div>
    {isAuth ? (
      <Link to="/profile"><Button variant="outline">Профиль</Button></Link>
    ) : (
      <Link to="/login"><Button>Войти</Button></Link>
    )}
    </div>
    </div>
    </header>
  );
}
END
echo "export { default as Header } from './ui/header';" > src/widgets/header/index.js

cat > src/widgets/footer/ui/footer.jsx << 'END'
export default function Footer() {
  return (
    <footer style={{ padding: '40px 0', marginTop: 'auto', borderTop: '1px solid #E0E0E0' }}>
    <div className="container text-center text-muted">
    © 2022 OkeyPost. Все права защищены.
    </div>
    </footer>
  );
}
END
echo "export { default as Footer } from './ui/footer';" > src/widgets/footer/index.js

cat > src/main.jsx << 'END'
import React from 'react';
import ReactDOM from 'react-dom/client';
import { RouterProvider } from 'react-router-dom';
import { router } from './app/router';
import './app/styles/global.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
  <RouterProvider router={router} />
  </React.StrictMode>,
);
END

echo "✅ База готова! Проект развернут, формы и роутинг работают."
