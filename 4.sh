#!/bin/bash
echo "🔥 Полная пересборка OkeyPost (FSD + Логика + Заглушки для друга)..."

# Удаляем старую папку src, чтобы не было мусора
rm -rf src

# 1. Установка зависимостей (на всякий случай, если чего-то нет)
npm install react-router-dom zustand react-hook-form zod @hookform/resolvers lucide-react

# 2. Настройка Vite (Алиасы)
cat > vite.config.js << 'END'
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: { '@': path.resolve(__dirname, './src') },
  },
});
END

# ==========================================
# 3. СОЗДАНИЕ ПАПОК (FSD)
# ==========================================
mkdir -p src/app/{router,styles,layouts}
mkdir -p src/pages/{home-page,how-to-buy-page,sales-page,prices-page,faq-page,partnership-page,blog-page,stores-page,login-page,register-page,profile-page,orders-page,create-parcel-page}/ui
mkdir -p src/widgets/{header,footer}/ui
mkdir -p src/features/{login-form,register-form,parcel-form,change-password,orders-filter,delivery-calculator}/ui
mkdir -p src/entities/{order-row,store-card}/ui
mkdir -p src/shared/{ui/button,ui/input,ui/select,ui/tabs,store,mock}
mkdir -p public/images

# ==========================================
# 4. ГЛОБАЛЬНЫЕ СТИЛИ
# ==========================================
cat > src/app/styles/global.css << 'END'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

:root {
  --bg-main: #F5F7FA; --bg-card: #FFFFFF;
  --primary-blue: #40B8EA; --primary-purple: #5B52A3; --primary-green: #00B33B;
  --text-main: #1A1A1A; --text-muted: #8A8A8A; --border: #E0E0E0;
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
.page-wrapper { padding-top: 40px; padding-bottom: 80px; min-height: 70vh; }
END

# ==========================================
# 5. SHARED (UI Кит и Стейт)
# ==========================================
cat > src/shared/store/auth-store.js << 'END'
import { create } from 'zustand';
import { persist } from 'zustand/middleware';

export const useAuthStore = create(persist((set) => ({
  user: null, isAuth: false,
  login: (userData) => set({ user: userData, isAuth: true }),
  logout: () => set({ user: null, isAuth: false }),
}), { name: 'okeypost-auth' }));
END

# Button
cat > src/shared/ui/button/ui/button.jsx << 'END'
import './button.css';
export const Button = ({ children, variant = 'primary', className = '', ...props }) => (
  <button className={`btn btn-${variant} ${className}`} {...props}>{children}</button>
);
END
cat > src/shared/ui/button/ui/button.css << 'END'
.btn { padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; transition: 0.2s; display: inline-flex; align-items: center; justify-content: center; gap: 8px; }
.btn-primary { background: var(--primary-green); color: #fff; }
.btn-primary:hover { background: #009933; }
.btn-outline { border: 1px solid var(--primary-blue); color: var(--primary-blue); background: transparent; }
.btn-outline:hover { background: #e6f7ff; }
.btn-blue { background: var(--primary-blue); color: #fff; }
.btn:disabled { opacity: 0.5; cursor: not-allowed; }
END
echo "export * from './ui/button';" > src/shared/ui/button/index.js

# Input
cat > src/shared/ui/input/ui/input.jsx << 'END'
import './input.css';
export const Input = ({ label, error, register, ...props }) => (
  <div className="input-group">
    {label && <label>{label}</label>}
    <input className={error ? 'error' : ''} {...register} {...props} />
    {error && <span className="error-text">{error.message}</span>}
  </div>
);
END
cat > src/shared/ui/input/ui/input.css << 'END'
.input-group { display: flex; flex-direction: column; gap: 6px; margin-bottom: 16px; width: 100%; }
.input-group label { font-size: 14px; font-weight: 500; color: var(--text-main); }
.input-group input { padding: 12px 16px; border: 1px solid var(--border); border-radius: 8px; font-size: 14px; outline: none; transition: 0.2s; background: #fff; width: 100%; }
.input-group input:focus { border-color: var(--primary-blue); box-shadow: 0 0 0 3px rgba(64, 184, 234, 0.1); }
.input-group input.error { border-color: red; }
.error-text { color: red; font-size: 12px; }
END
echo "export * from './ui/input';" > src/shared/ui/input/index.js

# Select
cat > src/shared/ui/select/ui/select.jsx << 'END'
import './select.css';
export const Select = ({ label, options, register, error, ...props }) => (
  <div className="input-group">
    {label && <label>{label}</label>}
    <select className={error ? 'error' : ''} {...register} {...props}>
      <option value="">Выберите...</option>
      {options.map(opt => <option key={opt.value} value={opt.value}>{opt.label}</option>)}
    </select>
    {error && <span className="error-text">{error.message}</span>}
  </div>
);
END
cat > src/shared/ui/select/ui/select.css << 'END'
.input-group select { padding: 12px 16px; border: 1px solid var(--border); border-radius: 8px; font-size: 14px; outline: none; background: #fff; width: 100%; cursor: pointer;}
.input-group select:focus { border-color: var(--primary-blue); }
END
echo "export * from './ui/select';" > src/shared/ui/select/index.js

# Tabs
cat > src/shared/ui/tabs/ui/tabs.jsx << 'END'
import './tabs.css';
export const Tabs = ({ tabs, activeTab, onChange }) => (
  <div className="tabs-container">
    {tabs.map((tab) => (
      <button key={tab.id} className={`tab-btn ${activeTab === tab.id ? 'active' : ''}`} onClick={() => onChange(tab.id)}>
        {tab.label}
      </button>
    ))}
  </div>
);
END
cat > src/shared/ui/tabs/ui/tabs.css << 'END'
.tabs-container { display: flex; gap: 24px; border-bottom: 1px solid var(--border); margin-bottom: 24px; }
.tab-btn { padding: 12px 0; font-size: 16px; color: var(--text-muted); border-bottom: 2px solid transparent; margin-bottom: -1px; transition: 0.2s; }
.tab-btn:hover { color: var(--primary-blue); }
.tab-btn.active { color: var(--primary-blue); border-bottom-color: var(--primary-blue); font-weight: 600; }
END
echo "export * from './ui/tabs';" > src/shared/ui/tabs/index.js

# Mock Data
cat > src/shared/mock/data.js << 'END'
export const mockOrders = [
  { id: '501', date: '15.10.2022', track: 'UK123456789', sum: '12 450 ₽', status: 'В пути' },
  { id: '502', date: '18.10.2022', track: 'UK987654321', sum: '5 200 ₽', status: 'На складе' },
  { id: '503', date: '20.10.2022', track: 'UK111222333', sum: '34 100 ₽', status: 'Доставлен' },
  { id: '504', date: '22.10.2022', track: 'UK444555666', sum: '1 500 ₽', status: 'В пути' },
];
export const mockFaq = [
  { id: 1, q: 'Как узнать, что заказ пришел на склад?', a: 'Вам придет SMS-уведомление и письмо на почту.' },
  { id: 2, q: 'Сколько стоит виртуальный адрес?', a: 'Бесплатно при регистрации.' },
  { id: 3, q: 'Как оплатить доставку?', a: 'Картой, через PayPal или с баланса личного кабинета.' },
  { id: 4, q: 'Что делать, если посылка потерялась?', a: 'Свяжитесь с поддержкой, мы проведем расследование.' },
];
export const mockStores = [
  { id: 1, name: 'PRIMARK', logo: '/images/store1.png' },
  { id: 2, name: 'H&M', logo: '/images/store2.png' },
  { id: 3, name: 'MANGO', logo: '/images/store3.png' },
  { id: 4, name: 'ZARA', logo: '/images/store4.png' },
];
END

# ==========================================
# 6. ENTITIES (Карточки)
# ==========================================
cat > src/entities/order-row/ui/order-row.jsx << 'END'
import './order-row.css';
export default function OrderRow({ order }) {
  return (
    <tr className="order-row">
      <td>#{order.id}</td><td>{order.date}</td><td>{order.track}</td><td>{order.sum}</td>
      <td><span className="status-badge">{order.status}</span></td>
    </tr>
  );
}
END
cat > src/entities/order-row/ui/order-row.css << 'END'
.order-row { border-bottom: 1px solid var(--border); }
.order-row td { padding: 16px; font-size: 14px; }
.status-badge { background: #E6F7FF; color: var(--primary-blue); padding: 4px 12px; border-radius: 12px; font-size: 12px; font-weight: 600;}
END
echo "export { default as OrderRow } from './ui/order-row';" > src/entities/order-row/index.js

cat > src/entities/store-card/ui/store-card.jsx << 'END'
import './store-card.css';
export default function StoreCard({ store }) {
  return (
    <div className="store-card">
      <img src={store.logo} alt={store.name} className="store-logo" />
      <p>{store.name}</p>
    </div>
  );
}
END
cat > src/entities/store-card/ui/store-card.css << 'END'
.store-card { background: #fff; border-radius: 16px; padding: 24px; display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 16px; transition: 0.3s; cursor: pointer; border: 1px solid var(--border); height: 120px;}
.store-card:hover { transform: translateY(-4px); box-shadow: 0 10px 20px rgba(0,0,0,0.05); border-color: var(--primary-blue); }
.store-logo { max-width: 100px; max-height: 40px; object-fit: contain; }
END
echo "export { default as StoreCard } from './ui/store-card';" > src/entities/store-card/index.js

# ==========================================
# 7. WIDGETS (Header & Footer)
# ==========================================
cat > src/widgets/header/ui/header.jsx << 'END'
import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import { useAuthStore } from '@/shared/store/auth-store';
import { User } from 'lucide-react';
import './header.css';

export default function Header() {
  const isAuth = useAuthStore((state) => state.isAuth);
  return (
    <header className="header">
      <div className="container header-container">
        <Link to="/" className="logo">
          <img src="/images/logo.png" alt="OkeyPost" style={{height: 32}} />
        </Link>
        <nav className="nav">
           <Link to="/">Как покупать</Link>
           <Link to="/sales">Распродажи</Link>
           <Link to="/prices">Цены</Link>
           <Link to="/faq">Помощь</Link>
           <Link to="/stores">Магазины</Link>
        </nav>
        <div className="header-actions">
          {isAuth ? (
            <Link to="/profile" className="profile-link"><User size={20} /> Профиль</Link>
          ) : (
            <Link to="/login"><Button>Войти</Button></Link>
          )}
        </div>
      </div>
    </header>
  );
}
END
cat > src/widgets/header/ui/header.css << 'END'
.header { background: #fff; border-bottom: 1px solid var(--border); padding: 16px 0; position: sticky; top: 0; z-index: 100; }
.header-container { display: flex; justify-content: space-between; align-items: center; }
.logo { font-size: 24px; font-weight: 700; color: var(--primary-blue); display: flex; align-items: center;}
.nav { display: flex; gap: 24px; font-size: 14px; font-weight: 500; color: var(--text-muted); }
.nav a:hover { color: var(--primary-blue); }
.header-actions { display: flex; align-items: center; gap: 16px; }
.profile-link { display: flex; align-items: center; gap: 8px; font-weight: 600; color: var(--text-main); }
END
echo "export { default as Header } from './ui/header';" > src/widgets/header/index.js

cat > src/widgets/footer/ui/footer.jsx << 'END'
import './footer.css';
export default function Footer() {
  return (
    <footer className="footer">
      <div className="container footer-container">
        <div>© 2022 OkeyPost. Все права защищены.</div>
        <div className="socials">Соцсети</div>
      </div>
    </footer>
  );
}
END
cat > src/widgets/footer/ui/footer.css << 'END'
.footer { background: #fff; border-top: 1px solid var(--border); padding: 32px 0; margin-top: auto; }
.footer-container { display: flex; justify-content: space-between; color: var(--text-muted); font-size: 14px; }
END
echo "export { default as Footer } from './ui/footer';" > src/widgets/footer/index.js

# ==========================================
# 8. FEATURES (Твоя логика: Формы и Фильтры)
# ==========================================

# Login Form
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
  const { register, handleSubmit, formState: { errors, isSubmitting } } = useForm({ resolver: zodResolver(schema) });

  const onSubmit = async (data) => {
    await new Promise(res => setTimeout(res, 1000));
    login({ name: 'Пользователь', email: data.email });
    navigate('/profile');
  };

  return (
    <form className="login-form" onSubmit={handleSubmit(onSubmit)}>
      <h2 className="title-h2 text-center mb-8">Вход в личный кабинет</h2>
      <Input label="Ваш email" placeholder="test@mail.com" register={register('email')} error={errors.email} />
      <Input label="Ваш пароль" type="password" placeholder="******" register={register('password')} error={errors.password} />
      <Button type="submit" disabled={isSubmitting} style={{ width: '100%' }}>Войти</Button>
    </form>
  );
};
END
cat > src/features/login-form/ui/login-form.css << 'END'
.login-form { background: #fff; padding: 40px; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); max-width: 400px; margin: 0 auto; }
END
echo "export * from './ui/login-form';" > src/features/login-form/index.js

# Parcel Form
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
  description: z.string().min(10, 'Мин 10 символов'),
  agree: z.boolean().refine(val => val === true, 'Согласитесь с правилами'),
});

export const ParcelForm = () => {
  const { register, handleSubmit, formState: { errors, isSubmitting } } = useForm({ resolver: zodResolver(schema) });

  const onSubmit = async () => {
    await new Promise(res => setTimeout(res, 1000));
    alert('Посылка создана!');
  };

  return (
    <form className="parcel-form" onSubmit={handleSubmit(onSubmit)}>
      <div className="form-row">
        <Input label="Трек-номер" placeholder="UK12345" register={register('trackNumber')} error={errors.trackNumber} />
        <Input label="Вес (кг)" type="number" placeholder="1.5" register={register('weight')} error={errors.weight} />
      </div>
      <div className="input-group">
        <label>Описание</label>
        <textarea className={errors.description ? 'error' : ''} {...register('description')} rows="4"></textarea>
        {errors.description && <span className="error-text">{errors.description.message}</span>}
      </div>
      <div className="checkbox-group">
        <input type="checkbox" id="agree" {...register('agree')} />
        <label htmlFor="agree">Согласен с правилами</label>
      </div>
      {errors.agree && <span className="error-text">{errors.agree.message}</span>}
      <Button type="submit" disabled={isSubmitting} className="mt-4">Создать</Button>
    </form>
  );
};
END
cat > src/features/parcel-form/ui/parcel-form.css << 'END'
.parcel-form { background: #fff; padding: 32px; border-radius: 16px; }
.form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
.checkbox-group { display: flex; align-items: center; gap: 10px; margin: 16px 0; font-size: 14px;}
textarea { width: 100%; padding: 12px; border: 1px solid var(--border); border-radius: 8px; font-family: inherit; outline: none;}
textarea:focus { border-color: var(--primary-blue); }
textarea.error { border-color: red; }
END
echo "export * from './ui/parcel-form';" > src/features/parcel-form/index.js

# Change Password Feature
cat > src/features/change-password/ui/change-password.jsx << 'END'
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';

const schema = z.object({
  oldPass: z.string().min(1, 'Введите текущий пароль'),
  newPass: z.string().min(6, 'Минимум 6 символов'),
  confirmPass: z.string()
}).refine((data) => data.newPass === data.confirmPass, {
  message: 'Пароли не совпадают', path: ['confirmPass'],
});

export const ChangePassword = () => {
  const { register, handleSubmit, formState: { errors, isSubmitting }, reset } = useForm({ resolver: zodResolver(schema) });
  const onSubmit = async () => { await new Promise(r => setTimeout(r, 1000)); alert('Пароль изменен!'); reset(); };

  return (
    <form onSubmit={handleSubmit(onSubmit)} style={{ maxWidth: '400px' }}>
      <Input label="Текущий пароль" type="password" register={register('oldPass')} error={errors.oldPass} />
      <Input label="Новый пароль" type="password" register={register('newPass')} error={errors.newPass} />
      <Input label="Повторите пароль" type="password" register={register('confirmPass')} error={errors.confirmPass} />
      <Button type="submit" disabled={isSubmitting}>Сохранить</Button>
    </form>
  );
};
END
echo "export * from './ui/change-password';" > src/features/change-password/index.js

# Orders Filter Feature
cat > src/features/orders-filter/ui/orders-filter.jsx << 'END'
import React from 'react';
import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Select } from '@/shared/ui/select';

export const OrdersFilter = ({ onChange }) => {
  const { register, watch } = useForm();
  const search = watch('search');
  const status = watch('status');

  React.useEffect(() => { onChange({ search, status }); }, [search, status, onChange]);

  return (
    <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '24px' }}>
      <Input placeholder="Поиск по номеру..." register={register('search')} />
      <Select options={[{value: 'В пути', label: 'В пути'}, {value: 'На складе', label: 'На складе'}, {value: 'Доставлен', label: 'Доставлен'}]} register={register('status')} />
    </div>
  );
};
END
echo "export * from './ui/orders-filter';" > src/features/orders-filter/index.js

# Delivery Calculator Feature
cat > src/features/delivery-calculator/ui/delivery-calculator.jsx << 'END'
import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';

export const DeliveryCalculator = () => {
  const [price, setPrice] = useState(null);
  const { register, handleSubmit } = useForm();

  const onSubmit = (data) => {
    const volume = (data.length * data.width * data.height) / 5000;
    const total = 500 + (Number(data.weight) * 200) + (volume * 100);
    setPrice(Math.round(total));
  };

  return (
    <div style={{ background: '#fff', padding: '24px', borderRadius: '16px', maxWidth: '500px' }}>
      <form onSubmit={handleSubmit(onSubmit)}>
        <Input label="Вес (кг)" type="number" step="0.1" register={register('weight')} />
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: '10px' }}>
          <Input label="Длина" type="number" register={register('length')} />
          <Input label="Ширина" type="number" register={register('width')} />
          <Input label="Высота" type="number" register={register('height')} />
        </div>
        <Button type="submit" className="mt-4">Рассчитать</Button>
      </form>
      {price !== null && (
        <div style={{ marginTop: '20px', padding: '16px', background: '#E6F7FF', borderRadius: '8px' }}>
          <p className="text-muted">Стоимость:</p><h2 style={{ color: 'var(--primary-blue)' }}>{price} ₽</h2>
        </div>
      )}
    </div>
  );
};
END
echo "export * from './ui/delivery-calculator';" > src/features/delivery-calculator/index.js


# ==========================================
# 9. PAGES (Сборка страниц)
# ==========================================

# HOME PAGE
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { StoreCard } from '@/entities/store-card';
import { mockStores } from '@/shared/mock/data';
import './home-page.css';

export default function HomePage() {
  return (
    <div>
      <div className="container mt-8">
        <div className="hero-banner">
          <div className="hero-text">
            <h1>Доставка товаров из Великобритании в Россию</h1>
            <p className="mt-4">Начните экономить до 80% на шоппинге.</p>
            <Button className="mt-8">Получить адрес в UK</Button>
          </div>
          <div className="hero-img">
             {/* Заглушка для картинки */}
             <img src="/images/hero.png" alt="Hero" />
          </div>
        </div>

        <h2 className="title-h2 mt-8 mb-4">Популярные магазины</h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))', gap: '20px' }}>
          {mockStores.map(store => <StoreCard key={store.id} store={store} />)}
        </div>
      </div>
    </div>
  );
}
END
cat > src/pages/home-page/ui/home-page.css << 'END'
.hero-banner { background: linear-gradient(90deg, #5B52A3, #40B8EA); border-radius: 36px; padding: 60px; color: #fff; display: flex; justify-content: space-between; align-items: center; min-height: 400px; }
.hero-text { max-width: 500px; }
.hero-text h1 { font-size: 40px; line-height: 1.2; }
.hero-img img { max-width: 400px; }
@media (max-width: 768px) { .hero-banner { flex-direction: column; text-align: center; padding: 30px; } }
END
echo "export { default as HomePage } from './ui/home-page';" > src/pages/home-page/index.js

# LOGIN PAGE
cat > src/pages/login-page/ui/login-page.jsx << 'END'
import { LoginForm } from '@/features/login-form';
export default function LoginPage() {
  return <div className="container page-wrapper mt-8"><LoginForm /></div>;
}
END
echo "export { default as LoginPage } from './ui/login-page';" > src/pages/login-page/index.js

# PROFILE PAGE
cat > src/pages/profile-page/ui/profile-page.jsx << 'END'
import { useState } from 'react';
import { useAuthStore } from '@/shared/store/auth-store';
import { Button } from '@/shared/ui/button';
import { Tabs } from '@/shared/ui/tabs';
import { ChangePassword } from '@/features/change-password';
import { useNavigate } from 'react-router-dom';
import './profile-page.css';

export default function ProfilePage() {
  const { user, logout } = useAuthStore();
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState('address');

  return (
    <div className="container page-wrapper">
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '32px' }}>
        <h1 className="title-h1">Личный кабинет</h1>
        <Button variant="outline" onClick={() => { logout(); navigate('/'); }}>Выйти</Button>
      </div>
      <Tabs tabs={[{ id: 'address', label: 'Виртуальный адрес' }, { id: 'password', label: 'Изменить пароль' }]} activeTab={activeTab} onChange={setActiveTab} />
      <div style={{ background: '#fff', padding: '32px', borderRadius: '16px', minHeight: '300px' }}>
        {activeTab === 'address' && (
          <div>
            <h3 className="mb-4">Ваш адрес в Великобритании</h3>
            <div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px', fontFamily: 'monospace' }}>
              <p>Name: {user?.name || 'Dmitry'}</p>
              <p>Address: Unit 5, 12 Market St, London, UK</p>
            </div>
          </div>
        )}
        {activeTab === 'password' && <ChangePassword />}
      </div>
    </div>
  );
}
END
cat > src/pages/profile-page/ui/profile-page.css << 'END'
/* Стили для страницы профиля, если нужны */
END
echo "export { default as ProfilePage } from './ui/profile-page';" > src/pages/profile-page/index.js

# ORDERS PAGE
cat > src/pages/orders-page/ui/orders-page.jsx << 'END'
import { useState } from 'react';
import { OrdersFilter } from '@/features/orders-filter';
import { OrderRow } from '@/entities/order-row';
import { mockOrders } from '@/shared/mock/data';
import './orders-page.css';

export default function OrdersPage() {
  const [filter, setFilter] = useState({ search: '', status: '' });
  const filteredOrders = mockOrders.filter(order => {
    const matchSearch = order.track.toLowerCase().includes(filter.search.toLowerCase()) || order.id.includes(filter.search);
    const matchStatus = filter.status ? order.status === filter.status : true;
    return matchSearch && matchStatus;
  });

  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Мои заказы</h1>
      <OrdersFilter onChange={setFilter} />
      <div style={{ background: '#fff', borderRadius: '16px', overflow: 'hidden' }}>
        <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left' }}>
          <thead style={{ background: '#F5F7FA', borderBottom: '1px solid #E0E0E0' }}>
            <tr><th>Заказ</th><th>Дата</th><th>Трек</th><th>Сумма</th><th>Статус</th></tr>
          </thead>
          <tbody>
            {filteredOrders.map(order => <OrderRow key={order.id} order={order} />)}
          </tbody>
        </table>
        {filteredOrders.length === 0 && <p style={{ padding: '32px', textAlign: 'center' }}>Ничего не найдено</p>}
      </div>
    </div>
  );
}
END
cat > src/pages/orders-page/ui/orders-page.css << 'END'
/* Стили для таблицы */
th { padding: 16px; font-weight: 500; color: var(--text-muted); }
END
echo "export { default as OrdersPage } from './ui/orders-page';" > src/pages/orders-page/index.js

# CREATE PARCEL PAGE
cat > src/pages/create-parcel-page/ui/create-parcel-page.jsx << 'END'
import { ParcelForm } from '@/features/parcel-form';
export default function CreateParcelPage() {
  return <div className="container page-wrapper"><ParcelForm /></div>;
}
END
echo "export { default as CreateParcelPage } from './ui/create-parcel-page';" > src/pages/create-parcel-page/index.js

# FAQ PAGE
cat > src/pages/faq-page/ui/faq-page.jsx << 'END'
import { useState } from 'react';
import { mockFaq } from '@/shared/mock/data';
import './faq-page.css';

export default function FaqPage() {
  const [openId, setOpenId] = useState(null);
  const [search, setSearch] = useState('');
  const filtered = mockFaq.filter(item => item.q.toLowerCase().includes(search.toLowerCase()));

  return (
    <div className="container page-wrapper" style={{ maxWidth: '800px' }}>
      <h1 className="title-h1 mb-8 text-center">Часто задаваемые вопросы</h1>
      <input type="text" placeholder="Поиск..." value={search} onChange={(e) => setSearch(e.target.value)} className="search-input" />
      {filtered.map(item => (
        <div key={item.id} className="faq-item">
          <div onClick={() => setOpenId(openId === item.id ? null : item.id)} className="faq-question">
            {item.q} <span>{openId === item.id ? '−' : '+'}</span>
          </div>
          {openId === item.id && <div className="faq-answer">{item.a}</div>}
        </div>
      ))}
    </div>
  );
}
END
cat > src/pages/faq-page/ui/faq-page.css << 'END'
.search-input { width: 100%; padding: 16px; border-radius: 8px; border: 1px solid var(--border); margin-bottom: 32px; outline: none;}
.faq-item { background: #fff; margin-bottom: 16px; border-radius: 8px; }
.faq-question { padding: 20px; cursor: pointer; display: flex; justify-content: space-between; font-weight: 600; }
.faq-answer { padding: 0 20px 20px; color: var(--text-muted); }
END
echo "export { default as FaqPage } from './ui/faq-page';" > src/pages/faq-page/index.js

# CALCULATOR PAGE
cat > src/pages/calculator-page/ui/calculator-page.jsx << 'END'
import { DeliveryCalculator } from '@/features/delivery-calculator';
export default function CalculatorPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Калькулятор доставки</h1>
      <DeliveryCalculator />
    </div>
  );
}
END
echo "export { default as CalculatorPage } from './ui/calculator-page';" > src/pages/calculator-page/index.js

# ЗАГЛУШКИ ДЛЯ ОСТАЛЬНЫХ СТРАНИЦ (Чтобы не было ошибок в роутере)
for page in how-to-buy-page sales-page prices-page partnership-page blog-page stores-page register-page; do
  cat > src/pages/$page/ui/$page.jsx << END
import './$page.css';
export default function ${page//-/}() {
  return (
    <div className="container page-wrapper text-center">
      <h1 className="title-h1">Страница ${page//-/}</h1>
      <p className="mt-4 text-muted">Друг, тут ты верстаешь этот раздел по макету Figma.</p>
    </div>
  );
}
END
  touch src/pages/$page/ui/$page.css
  # Убираем дефисы из имени компонента для экспорта
  comp_name=$(echo "$page" | sed -r 's/(^|-)([a-z])/\U\2/g')
  echo "export { default as $comp_name } from './ui/$page';" > src/pages/$page/index.js
done

# ==========================================
# 10. APP, LAYOUTS, ROUTER
# ==========================================
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
import { OrdersPage } from '@/pages/orders-page';
import { CalculatorPage } from '@/pages/calculator-page';
import { FaqPage } from '@/pages/faq-page';
import { HowToBuyPage } from '@/pages/how-to-buy-page';
import { SalesPage } from '@/pages/sales-page';
import { PricesPage } from '@/pages/prices-page';
import { StoresPage } from '@/pages/stores-page';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <MainLayout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: 'login', element: <LoginPage /> },
      { path: 'how-to-buy', element: <HowToBuyPage /> },
      { path: 'sales', element: <SalesPage /> },
      { path: 'prices', element: <PricesPage /> },
      { path: 'stores', element: <StoresPage /> },
      { path: 'calculator', element: <CalculatorPage /> },
      { path: 'faq', element: <FaqPage /> },
      {
        element: <ProtectedRoute />,
        children: [
          { path: 'profile', element: <ProfilePage /> },
          { path: 'create-parcel', element: <CreateParcelPage /> },
          { path: 'orders', element: <OrdersPage /> },
        ]
      }
    ]
  }
]);
END

cat > src/app/App.jsx << 'END'
import { RouterProvider } from 'react-router-dom';
import { router } from './router';
export default function App() { return <RouterProvider router={router} />; }
END

cat > src/main.jsx << 'END'
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './app/App';
import './app/styles/global.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
END

echo "✅ ПОЛНЫЙ КАРКАС ГОТОВ!"
echo "Запускай 'npm run dev' и проверяй."
echo "Скинь проект другу и скажи: 'Замени заглушки в pages и widgets на свои стили из Figma'."
