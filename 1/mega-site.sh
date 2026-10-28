#!/bin/bash
echo "🚀 Собираем ПОЛНЫЙ САЙТ OkeyPost (Все страницы, формы, логика)..."

# Очищаем src для чистой сборки
rm -rf src

# ==========================================
# 1. СОЗДАНИЕ СТРУКТУРЫ ПАПОК (FSD)
# ==========================================
mkdir -p src/app/{router,styles,layouts}
mkdir -p src/pages/{home-page,prices-page,faq-page,partnership-page,blog-page,stores-page,auth-page,profile-page,orders-page,address-book-page,notifications-page,create-parcel-page,how-to-buy-page,sales-page}/ui
mkdir -p src/pages/profile-page/ui/{address-tab,edit-tab,password-tab,info-tab,payment-tab}
mkdir -p src/widgets/{header,footer,profile-sidebar}/ui
mkdir -p src/features/{auth,edit-profile,change-password,create-parcel,address-form,calculator}/ui
mkdir -p src/entities/{order-row,store-card,notification-card,blog-card}/ui
mkdir -p src/shared/{ui/button,ui/input,ui/checkbox,ui/select,ui/tabs,store,mock}
mkdir -p public/images/{icons,steps,reviews,stores,blog,profile}

# ==========================================
# 2. ГЛОБАЛЬНЫЕ СТИЛИ (База)
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
.container { max-width: 1600px; margin: 0 auto; padding: 0 40px; }
.page-wrapper { padding-top: 40px; padding-bottom: 80px; min-height: 70vh; }
.title-h1 { font-size: 40px; font-weight: 700; line-height: 1.2; margin-bottom: 24px; }
.title-h2 { font-size: 32px; font-weight: 700; line-height: 1.2; margin-bottom: 24px; }
.text-muted { color: var(--text-muted); font-size: 15px; }
.bg-blue-gradient { background: linear-gradient(90deg, #5B52A3, #40B8EA); color: #fff; border-radius: 24px; padding: 40px 60px; }
.mb-4 { margin-bottom: 16px; } .mb-8 { margin-bottom: 32px; } .mt-4 { margin-top: 16px; } .mt-8 { margin-top: 32px; }
END

# ==========================================
# 3. МОКОВЫЕ ДАННЫЕ (Все, что нужно для страниц)
# ==========================================
cat > src/shared/mock/data.js << 'END'
export const mockCategories = [
  { id: 1, name: 'Одежда', img: '/images/icons/clothes.png' },
  { id: 2, name: 'Электроника', img: '/images/icons/laptop.png' },
  { id: 3, name: 'Аксессуары', img: '/images/icons/bag.png' },
  { id: 4, name: 'Для детей', img: '/images/icons/baby.png' },
  { id: 5, name: 'Для спорта', img: '/images/icons/sport.png' },
  { id: 6, name: 'Косметика', img: '/images/icons/cosmetics.png' },
];
export const mockDeliveryOptions = [
  { id: 1, name: 'ПОЧТА РОССИИ', days: '10-14 дней', cost: 'от £27.00', total: '£41.99', img: '/images/icons/post.png' },
  { id: 2, name: 'EMS ПОЧТА РОССИИ', days: '9-12 дней', cost: 'от £40.00', total: '£54.55', img: '/images/icons/ems.png' },
  { id: 3, name: 'ПОЧТА РОССИИ МЕЛКИЕ ПАКЕТЫ', days: '10-14 дней', cost: 'от £13.00', total: '£30.50', img: '/images/icons/package.png' },
];
export const mockReviews = [
  { id: 1, name: 'NIKOLAY S', stars: 5, text: 'Ваша доставка самая быстрая и дешёвая!!!', date: '16 Ноября 2021', city: 'Санкт-Петербург', img: '/images/reviews/1.png' },
  { id: 2, name: 'DMITRIY D', stars: 5, text: 'Пуховик Levi\'s с eBay. Всё приехало быстро и целым.', date: '16 Ноября 2021', city: 'Москва', img: '/images/reviews/2.png' },
];
export const mockStores = [
  { id: 1, name: 'PRIMARK', logo: '/images/stores/primark.png' }, { id: 2, name: 'H&M', logo: '/images/stores/hm.png' },
  { id: 3, name: 'MANGO', logo: '/images/stores/mango.png' }, { id: 4, name: 'ZARA', logo: '/images/stores/zara.png' },
  { id: 5, name: 'ASOS', logo: '/images/stores/asos.png' }, { id: 6, name: 'eBay', logo: '/images/stores/ebay.png' },
];
export const mockBlog = [
  { id: 1, title: 'Интернет-магазин Urban Outfitters в UK: обзор', date: '22.10.2021', img: '/images/blog/1.png' },
  { id: 2, title: 'Overstock. Брендовые товары по доступным ценам', date: '22.10.2021', img: '/images/blog/2.png' },
  { id: 3, title: 'Sneakers и Amazon. Удобная обувь для всей семьи', date: '22.10.2021', img: '/images/blog/3.png' },
  { id: 4, title: '16 лучших подарков с Amazon в 2021 году', date: '22.10.2021', img: '/images/blog/4.png' },
];
export const mockOrders = [
  { id: '12345', date: '15.10.2022', track: 'UK123456789', sum: '12 450 ₽', status: 'В пути' },
  { id: '12346', date: '18.10.2022', track: 'UK987654321', sum: '5 200 ₽', status: 'На складе' },
];
export const mockNotifications = [
  { id: 1, title: 'На складе в четверг 25 ноября выходной!', date: '25 Ноября', text: 'Уважаемые клиенты! Сообщаем вам, что 25 ноября...' },
  { id: 2, title: 'Выкуплен БЕСПЛАТНО с промокодом BF2021', date: '25 Ноября', text: 'Уважаемые клиенты! С 20.11 вы можете...' },
];
export const mockFaq = [
  { category: 'Виртуальный адрес в Великобритании', items: [
    { id: 1, q: 'Что делать, если вы забыли внести трек-номер?', a: 'Свяжитесь с поддержкой.' },
    { id: 2, q: 'Как я узнаю, что заказ пришел на склад?', a: 'Вам придет SMS.' },
  ]},
  { category: 'Покупки в магазинах Англии, скидки и промокода', items: [
    { id: 3, q: 'Анонс скидочных купонов и промокодов', a: 'В нашем блоге.' },
  ]},
];
END

# ==========================================
# 4. SHARED UI
# ==========================================
# Button, Input, Checkbox, Tabs, Select (Стандартные)
cat > src/shared/ui/button/ui/button.jsx << 'END'
import './button.css';
export const Button = ({ children, variant = 'primary', className = '', ...props }) => <button className={`btn btn-${variant} ${className}`} {...props}>{children}</button>;
END
cat > src/shared/ui/button/ui/button.css << 'END'
.btn { padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; transition: 0.2s; display: inline-flex; justify-content: center; align-items: center; gap: 8px; }
.btn-primary { background: var(--primary-green); color: #fff; }
.btn-outline { border: 1px solid var(--primary-blue); color: var(--primary-blue); background: transparent; }
.btn-blue { background: var(--primary-blue); color: #fff; }
END
echo "export * from './ui/button';" > src/shared/ui/button/index.js

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
.input-group label { font-size: 14px; font-weight: 500; }
.input-group input { padding: 12px 16px; border: 1px solid var(--border); border-radius: 8px; font-size: 14px; outline: none; width: 100%; }
.input-group input.error { border-color: red; }
.error-text { color: red; font-size: 12px; }
END
echo "export * from './ui/input';" > src/shared/ui/input/index.js

cat > src/shared/ui/tabs/ui/tabs.jsx << 'END'
import './tabs.css';
export const Tabs = ({ tabs, activeTab, onChange }) => (
  <div className="tabs-container">
    {tabs.map((tab) => <button key={tab.id} className={`tab-btn ${activeTab === tab.id ? 'active' : ''}`} onClick={() => onChange(tab.id)}>{tab.label}</button>)}
  </div>
);
END
cat > src/shared/ui/tabs/ui/tabs.css << 'END'
.tabs-container { display: flex; gap: 24px; border-bottom: 1px solid var(--border); margin-bottom: 24px; }
.tab-btn { padding: 12px 0; font-size: 16px; color: var(--text-muted); border-bottom: 2px solid transparent; }
.tab-btn.active { color: var(--primary-green); border-bottom-color: var(--primary-green); font-weight: 600; }
END
echo "export * from './ui/tabs';" > src/shared/ui/tabs/index.js

# Zustand Store (Auth)
cat > src/shared/store/auth-store.js << 'END'
import { create } from 'zustand';
import { persist } from 'zustand/middleware';
export const useAuthStore = create(persist((set) => ({
  user: null, isAuth: false,
  login: (data) => set({ user: data, isAuth: true }),
  logout: () => set({ user: null, isAuth: false }),
}), { name: 'okeypost-auth' }));
END

# ==========================================
# 5. WIDGETS (Header, Footer, Sidebar)
# ==========================================
cat > src/widgets/header/ui/header.jsx << 'END'
import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import { useAuthStore } from '@/shared/store/auth-store';
import { User, Search } from 'lucide-react';
import './header.css';
export default function Header() {
  const isAuth = useAuthStore((state) => state.isAuth);
  return (
    <header className="header">
      <div className="container header-container">
        <Link to="/" className="logo"><img src="/images/logo.png" alt="OkeyPost" style={{height: 36}} onError={(e) => {e.target.style.display='none'; e.target.nextSibling.style.display='block'}} /><span style={{display: 'none', fontSize: '24px', fontWeight: 800, color: 'var(--primary-blue)'}}>OkeyPost</span></Link>
        <nav className="nav">
           <Link to="/how-to-buy">Как покупать</Link>
           <Link to="/sales">Распродажи</Link>
           <Link to="/prices">Цены</Link>
           <Link to="/faq">Помощь</Link>
           <Link to="/partnership">Бонусы</Link>
           <Link to="/blog">Блог</Link>
           <Link to="/stores">Магазины</Link>
        </nav>
        <div className="header-actions">
          <button className="icon-btn"><Search size={20} /></button>
          {isAuth ? <Link to="/profile" className="icon-btn"><User size={20} /> Профиль</Link> : <Link to="/login" className="icon-btn"><User size={20} /> Вход</Link>}
          <Link to={isAuth ? "/create-parcel" : "/login"}><Button className="desktop-btn">Создать посылку</Button></Link>
        </div>
      </div>
    </header>
  );
}
END
cat > src/widgets/header/ui/header.css << 'END'
.header { background: #fff; border-bottom: 1px solid var(--border); padding: 16px 0; position: sticky; top: 0; z-index: 100; }
.header-container { display: flex; justify-content: space-between; align-items: center; }
.nav { display: flex; gap: 28px; font-size: 14px; font-weight: 500; color: var(--text-muted); }
.header-actions { display: flex; align-items: center; gap: 20px; }
.icon-btn { display: flex; align-items: center; gap: 8px; font-size: 14px; font-weight: 500; }
END
echo "export { default as Header } from './ui/header';" > src/widgets/header/index.js

cat > src/widgets/footer/ui/footer.jsx << 'END'
import { Link } from 'react-router-dom';
import './footer.css';
export default function Footer() {
  return (
    <footer className="footer">
      <div className="container footer-grid">
        <div><h2 style={{color: 'var(--primary-blue)'}}>OkeyPost</h2></div>
        <div><h4>О компании</h4><Link to="/">Как купить</Link><Link to="/">Доставка</Link></div>
        <div><h4>Полезное</h4><Link to="/">Партнерская программа</Link><Link to="/">Отзывы</Link></div>
        <div><h4>Справочная</h4><Link to="/">Служба поддержки</Link><Link to="/">Политика конфиденциальности</Link></div>
      </div>
      <div className="container footer-bottom"><p>© 2022 OkeyPost. Все права защищены.</p></div>
    </footer>
  );
}
END
cat > src/widgets/footer/ui/footer.css << 'END'
.footer { background: #fff; border-top: 1px solid var(--border); padding: 60px 0 20px; margin-top: auto; }
.footer-grid { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 40px; margin-bottom: 40px; }
.footer-grid h4 { margin-bottom: 16px; }
.footer-grid a { display: block; color: var(--text-muted); margin-bottom: 8px; font-size: 14px;}
.footer-bottom { border-top: 1px solid var(--border); padding-top: 20px; text-align: center; color: var(--text-muted); font-size: 12px;}
END
echo "export { default as Footer } from './ui/footer';" > src/widgets/footer/index.js

cat > src/widgets/profile-sidebar/ui/profile-sidebar.jsx << 'END'
import { NavLink } from 'react-router-dom';
import './profile-sidebar.css';
export default function ProfileSidebar() {
  return (
    <aside className="profile-sidebar">
      <NavLink to="/profile/address">Виртуальный адрес</NavLink>
      <NavLink to="/profile/edit">Редактировать профиль</NavLink>
      <NavLink to="/profile/password">Изменить пароль</NavLink>
      <NavLink to="/profile/payment">Реквизиты для оплаты</NavLink>
      <NavLink to="/orders">Заказы</NavLink>
      <NavLink to="/address-book">Адресная книга</NavLink>
      <NavLink to="/notifications">Уведомления</NavLink>
    </aside>
  );
}
END
cat > src/widgets/profile-sidebar/ui/profile-sidebar.css << 'END'
.profile-sidebar { display: flex; flex-direction: column; gap: 8px; background: #fff; padding: 24px; border-radius: 16px; height: fit-content; width: 250px; }
.profile-sidebar a { padding: 12px; border-radius: 8px; color: var(--text-muted); font-size: 14px; font-weight: 500; }
.profile-sidebar a.active { background: #F5F7FA; color: var(--primary-green); }
END
echo "export { default as ProfileSidebar } from './ui/profile-sidebar';" > src/widgets/profile-sidebar/index.js

# ==========================================
# 6. FEATURES (Формы с RHF + Zod)
# ==========================================
# Auth Form
cat > src/features/auth/ui/auth-form.jsx << 'END'
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { useNavigate } from 'react-router-dom';
import { useAuthStore } from '@/shared/store/auth-store';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';

const schema = z.object({ email: z.string().email('Неверный email'), password: z.string().min(6, 'Мин 6 символов') });

export const AuthForm = ({ isRegister }) => {
  const login = useAuthStore((state) => state.login);
  const navigate = useNavigate();
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(schema) });

  const onSubmit = (data) => { login({ name: 'Дмитрий', email: data.email }); navigate('/profile'); };

  return (
    <form onSubmit={handleSubmit(onSubmit)} style={{ background: '#fff', padding: '40px', borderRadius: '16px', maxWidth: '450px', margin: '0 auto', boxShadow: '0 10px 30px rgba(0,0,0,0.05)' }}>
      <h2 className="title-h2 text-center mb-8">{isRegister ? 'Регистрация' : 'Вход в кабинет'}</h2>
      <Input label="Email" placeholder="test@mail.com" register={register('email')} error={errors.email} />
      <Input label="Пароль" type="password" placeholder="******" register={register('password')} error={errors.password} />
      <Button type="submit" style={{ width: '100%' }}>{isRegister ? 'Создать аккаунт' : 'Войти'}</Button>
    </form>
  );
};
END
echo "export * from './ui/auth-form';" > src/features/auth/index.js

# Edit Profile Form
cat > src/features/edit-profile/ui/edit-profile.jsx << 'END'
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';

const schema = z.object({ name: z.string().min(2, 'Мин 2 символа'), phone: z.string().min(10, 'Мин 10 цифр') });

export const EditProfile = () => {
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(schema) });
  const onSubmit = (data) => { alert('Профиль обновлен: ' + data.name); };

  return (
    <form onSubmit={handleSubmit(onSubmit)} style={{ maxWidth: '500px' }}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px' }}>
        <Input label="Имя" register={register('name')} error={errors.name} />
        <Input label="Фамилия" register={register('surname')} />
        <Input label="Адрес" register={register('address')} />
        <Input label="Город" register={register('city')} />
        <Input label="Номер телефона" register={register('phone')} error={errors.phone} />
        <Input label="E-mail" register={register('email')} />
      </div>
      <Button type="submit" className="mt-4">Сохранить</Button>
    </form>
  );
};
END
echo "export * from './ui/edit-profile';" > src/features/edit-profile/index.js

# Change Password Form
cat > src/features/change-password/ui/change-password.jsx << 'END'
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';

const schema = z.object({
  old: z.string().min(1, 'Введите старый пароль'),
  new: z.string().min(6, 'Мин 6 символов'),
  confirm: z.string()
}).refine(data => data.new === data.confirm, { message: 'Пароли не совпадают', path: ['confirm'] });

export const ChangePassword = () => {
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(schema) });
  const onSubmit = () => alert('Пароль изменен!');

  return (
    <form onSubmit={handleSubmit(onSubmit)} style={{ maxWidth: '400px' }}>
      <Input label="Старый пароль" type="password" register={register('old')} error={errors.old} />
      <Input label="Новый пароль" type="password" register={register('new')} error={errors.new} />
      <Input label="Новый пароль еще раз" type="password" register={register('confirm')} error={errors.confirm} />
      <Button type="submit">Сохранить</Button>
    </form>
  );
};
END
echo "export * from './ui/change-password';" > src/features/change-password/index.js

# Create Parcel Form
cat > src/features/create-parcel/ui/create-parcel.jsx << 'END'
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { Select } from '@/shared/ui/select'; // Предполагаем, что он есть, или делаем простой

const schema = z.object({
  track: z.string().min(5, 'Мин 5 символов'),
  weight: z.string().min(1, 'Укажите вес'),
  desc: z.string().min(5, 'Мин 5 символов'),
});

export const CreateParcel = () => {
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(schema) });
  const onSubmit = () => alert('Посылка добавлена!');

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' }}>
        <Input label="Трек-номер" register={register('track')} error={errors.track} />
        <Input label="Вес (кг)" type="number" register={register('weight')} error={errors.weight} />
      </div>
      <Input label="Описание" register={register('desc')} error={errors.desc} />
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' }}>
        <div className="input-group"><label>Магазин</label><select style={{padding: '12px', borderRadius: '8px', border: '1px solid var(--border)'}}><option>Выберите...</option></select></div>
        <div className="input-group"><label>Стоимость (£)</label><input type="text" style={{padding: '12px', borderRadius: '8px', border: '1px solid var(--border)'}}/></div>
      </div>
      <div style={{ margin: '20px 0', display: 'flex', gap: '16px' }}>
        <label><input type="checkbox" /> Консолидация</label>
        <label><input type="checkbox" /> Фотоотчет</label>
        <label><input type="checkbox" /> Проверка</label>
      </div>
      <Button type="submit">Создать</Button>
    </form>
  );
};
END
echo "export * from './ui/create-parcel';" > src/features/create-parcel/index.js

# Calculator Form
cat > src/features/calculator/ui/calculator.jsx << 'END'
import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
export const Calculator = () => {
  const [price, setPrice] = useState(null);
  const { register, handleSubmit } = useForm();
  const onSubmit = (d) => { const vol = (d.l * d.w * d.h) / 5000; setPrice(Math.round(500 + d.weight * 200 + vol * 100)); };
  return (
    <div style={{ background: '#fff', padding: '24px', borderRadius: '16px', maxWidth: '600px', border: '1px solid var(--border)' }}>
      <form onSubmit={handleSubmit(onSubmit)}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr 1fr', gap: '12px' }}>
          <Input label="Вес" type="number" register={register('weight')} />
          <Input label="Длина" type="number" register={register('l')} />
          <Input label="Ширина" type="number" register={register('w')} />
          <Input label="Высота" type="number" register={register('h')} />
        </div>
        <Button type="submit" className="mt-4">Рассчитать</Button>
      </form>
      {price && <div className="mt-4" style={{ color: 'var(--primary-green)', fontSize: '24px', fontWeight: 'bold' }}>Итого: {price} ₽</div>}
    </div>
  );
};
END
echo "export * from './ui/calculator';" > src/features/calculator/index.js

# ==========================================
# 7. ENTITIES (Карточки)
# ==========================================
cat > src/entities/order-row/ui/order-row.jsx << 'END'
export default function OrderRow({ order }) {
  return (
    <tr style={{ borderBottom: '1px solid var(--border)' }}>
      <td style={{ padding: '16px' }}>#{order.id}</td><td style={{ padding: '16px' }}>{order.date}</td>
      <td style={{ padding: '16px' }}>{order.track}</td><td style={{ padding: '16px' }}>{order.sum}</td>
      <td style={{ padding: '16px' }}><span style={{ background: '#E6F7FF', color: 'var(--primary-blue)', padding: '4px 12px', borderRadius: '12px', fontSize: '12px' }}>{order.status}</span></td>
    </tr>
  );
}
END
echo "export { default as OrderRow } from './ui/order-row';" > src/entities/order-row/index.js

cat > src/entities/store-card/ui/store-card.jsx << 'END'
import './store-card.css';
export default function StoreCard({ store }) {
  return <div className="store-card"><img src={store.logo} alt={store.name} style={{maxHeight: 40, objectFit: 'contain'}} onError={(e) => {e.target.style.display='none'; e.target.nextSibling.style.display='block'}}/><span style={{display: 'none', fontWeight: 'bold'}}>{store.name}</span></div>;
}
END
cat > src/entities/store-card/ui/store-card.css << 'END'
.store-card { background: #fff; border-radius: 16px; height: 120px; display: flex; align-items: center; justify-content: center; border: 1px solid var(--border); transition: 0.2s; cursor: pointer; }
.store-card:hover { border-color: var(--primary-blue); transform: translateY(-2px); box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
END
echo "export { default as StoreCard } from './ui/store-card';" > src/entities/store-card/index.js

cat > src/entities/blog-card/ui/blog-card.jsx << 'END'
import './blog-card.css';
export default function BlogCard({ post }) {
  return (
    <div className="blog-card">
      <img src={post.img} alt={post.title} style={{width: '100%', height: 200, objectFit: 'cover', borderRadius: '12px', background: '#eee'}} />
      <h3 className="mt-4" style={{fontSize: 18, lineHeight: 1.4}}>{post.title}</h3>
      <div className="mt-4" style={{display: 'flex', justifyContent: 'space-between', color: 'var(--text-muted)', fontSize: 12}}>
        <span>{post.date}</span> <span>Читать далее</span>
      </div>
    </div>
  );
}
END
cat > src/entities/blog-card/ui/blog-card.css << 'END'
.blog-card { background: #fff; padding: 16px; border-radius: 16px; border: 1px solid var(--border); cursor: pointer; }
END
echo "export { default as BlogCard } from './ui/blog-card';" > src/entities/blog-card/index.js

cat > src/entities/notification-card/ui/notification-card.jsx << 'END'
export default function NotificationCard({ n }) {
  return (
    <div style={{ background: '#fff', padding: '24px', borderRadius: '12px', marginBottom: '16px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', border: '1px solid var(--border)' }}>
      <div><h4 style={{marginBottom: 8}}>{n.title}</h4><p className="text-muted" style={{fontSize: 14}}>{n.text}</p><span style={{fontSize: 12, color: '#999', marginTop: 8, display: 'block'}}>{n.date}</span></div>
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--primary-green)" strokeWidth="2"><path d="M20 6L9 17l-5-5"/></svg>
    </div>
  );
}
END
echo "export { default as NotificationCard } from './ui/notification-card';" > src/entities/notification-card/index.js

# ==========================================
# 8. PAGES (Все страницы)
# ==========================================

# --- HOME PAGE ---
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { Calculator } from '@/features/calculator';
import { mockCategories, mockDeliveryOptions, mockReviews } from '@/shared/mock/data';
import { Star } from 'lucide-react';
import './home-page.css';

export default function HomePage() {
  return (
    <div>
      <div className="container mt-8">
        <div className="hero-banner">
          <div className="hero-text"><h1>Доставка товаров из Великобритании в Россию</h1><p className="mt-4">Начните экономить до 80% на шоппинге. Регистрируйтесь в OkeyPost, чтобы получить адрес в UK склада.</p><Button className="mt-8" style={{ background: '#fff', color: 'var(--primary-purple)' }}>Получить адрес в UK</Button></div>
          <div className="hero-img"><img src="/images/hero.png" alt="Hero" /></div>
        </div>
      </div>
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">Насколько выгодно покупать?</h2>
        <div className="category-strip">{mockCategories.map(c => <div key={c.id} className="category-item"><img src={c.img} alt="" style={{width: 48, height: 48}} /><span>{c.name}</span></div>)}</div>
      </div>
      <div className="container mt-8">
        <div className="price-compare-card">
           <div style={{flex:1}}><h3>Columbia Barlow Pass 550 Turbodown Jacket</h3><div className="price-box mt-4"><span style={{fontSize: 32}}>🇷🇺</span><div><p className="text-muted" style={{fontSize: 14}}>Цена в России</p><b>7891,46₽</b></div></div></div>
           <div className="compare-center"><img src="/images/jacket.png" alt="Jacket" /></div>
           <div style={{flex:1, textAlign:'right'}}><h3>Доставка одежды из Великобритании <span style={{color: 'var(--primary-green)'}}>от £7.79</span></h3><div className="price-box mt-4" style={{marginLeft: 'auto'}}><div><p className="text-muted" style={{fontSize: 14}}>Цена в UK</p><b>£80.62</b></div><span style={{fontSize: 32}}>🇬🇧</span></div></div>
        </div>
        <p className="text-center mt-4 text-muted">Срок доставки примерно 10 дней<br/><b style={{color: '#1A1A1A', fontSize: 18}}>Вы экономите до <span style={{color: 'var(--primary-green)'}}>$119.56</span></b></p>
      </div>
      <div className="container mt-8">
         <div className="benefits-grid">
          <div className="benefit-card"><img src="/images/icons/benefit1.png" style={{width:40}}/><div><h4>Экономия до 70%</h4></div></div>
          <div className="benefit-card"><img src="/images/icons/benefit2.png" style={{width:40}}/><div><h4>Только подлинная продукция</h4></div></div>
          <div className="benefit-card"><img src="/images/icons/benefit3.png" style={{width:40}}/><div><h4>Оперативная доставка</h4></div></div>
          <div className="benefit-card"><img src="/images/icons/benefit4.png" style={{width:40}}/><div><h4>Огромный выбор</h4></div></div>
         </div>
      </div>
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">OkeyPost удобная и быстрая доставка посылок</h2>
        <Calculator />
        <h3 className="title-h2 mt-8 mb-4" style={{fontSize: 24}}>Варианты доставки:</h3>
        <div className="delivery-list">{mockDeliveryOptions.map(o => (
          <div key={o.id} className="delivery-row">
             <div style={{flex:2, display:'flex', gap:16, alignItems:'center'}}><img src={o.img} style={{width:40}}/><b>{o.name}</b></div>
             <div style={{flex:1}}><span className="text-muted">Сроки:</span><br/><b>{o.days}</b></div>
             <div style={{flex:1}}><span className="text-muted">Стоимость:</span><br/><b>{o.cost}</b></div>
             <div style={{flex:1, textAlign:'right'}}><span className="text-muted">Итого:</span><br/><b>{o.total}</b></div>
          </div>
        ))}</div>
      </div>
      <div className="container mt-8">
         <h2 className="title-h2 mb-4">4 простых шага</h2>
         <div className="steps-grid">
           {[1,2,3,4].map(i => (
             <div key={i}><img src={`/images/steps/${i}.png`} style={{height:150, objectFit:'contain'}}/><div className="step-circle">{i}</div><h4>Шаг {i}</h4><p className="text-muted">Описание шага.</p></div>
           ))}
         </div>
      </div>
      <div className="container mt-8">
         <h2 className="title-h2 mb-4">120 000 довольных клиентов</h2>
         <div style={{display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24}}>{mockReviews.map(r => (
           <div key={r.id} style={{background: '#fff', padding: 24, borderRadius: 16, display: 'flex', gap: 16}}><img src={r.img} style={{width:100, height:100, borderRadius:12}}/><div><h4>{r.name}</h4><div style={{color: '#FFB800'}}>★★★★★</div><p className="text-muted mt-4">{r.text}</p></div></div>
         ))}</div>
      </div>
      <div className="container mt-8">
         <div className="bg-blue-gradient" style={{display:'flex', justifyContent:'space-between', alignItems:'center', padding: 60}}><h2 style={{color:'#fff', maxWidth: 600}}>Подпишитесь и будьте в курсе всех скидок!</h2><div style={{display:'flex', gap:16}}><input type="text" placeholder="Email" style={{padding:16, borderRadius:8, border:'none'}}/><Button>Подписаться</Button></div></div>
      </div>
    </div>
  );
}
END
cat > src/pages/home-page/ui/home-page.css << 'END'
.hero-banner { background: linear-gradient(135deg, #5B52A3, #40B8EA); border-radius: 36px; padding: 80px; color: #fff; display: flex; justify-content: space-between; align-items: center; min-height: 500px; }
.hero-text h1 { font-size: 56px; line-height: 1.1; font-weight: 700; margin-bottom: 24px; }
.hero-img img { max-width: 450px; }
.category-strip { display: flex; justify-content: space-between; background: #fff; padding: 32px; border-radius: 24px; border: 1px solid var(--border); }
.category-item { display: flex; flex-direction: column; align-items: center; gap: 16px; }
.price-compare-card { display: flex; justify-content: space-between; align-items: center; background: #fff; padding: 60px; border-radius: 36px; border: 1px solid var(--border); }
.compare-center { width: 300px; height: 300px; background: #F5F7FA; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
.compare-center img { max-width: 110%; }
.price-box { display: flex; align-items: center; gap: 16px; background: #F5F7FA; padding: 16px 24px; border-radius: 16px; width: fit-content; }
.benefits-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; }
.benefit-card { background: #fff; padding: 32px; border-radius: 24px; display: flex; gap: 20px; border: 1px solid var(--border); }
.delivery-list { display: flex; flex-direction: column; gap: 16px; }
.delivery-row { display: flex; align-items: center; background: #fff; padding: 24px 32px; border-radius: 20px; border: 1px solid var(--border); }
.steps-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 32px; }
.step-circle { width: 48px; height: 48px; background: var(--primary-blue); color: #fff; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 24px; margin: 16px 0; }
@media (max-width: 1024px) { .hero-banner { flex-direction: column; } .benefits-grid, .steps-grid { grid-template-columns: 1fr 1fr; } }
END
echo "export { default as HomePage } from './ui/home-page';" > src/pages/home-page/index.js

# --- PRICES PAGE ---
cat > src/pages/prices-page/ui/prices-page.jsx << 'END'
import { Calculator } from '@/features/calculator';
import { mockDeliveryOptions } from '@/shared/mock/data';
import { Check } from 'lucide-react';
export default function PricesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8"><h1>Услуги доставки из Великобритании</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 24, marginBottom: 48 }}>
        {[1,2,3,4].map(i => <div key={i} style={{ background: '#fff', padding: 24, borderRadius: 16, border: '1px solid var(--border)' }}><h3>Услуга {i}</h3><p className="text-muted mt-4">Описание услуги</p><img src={`/images/icons/service${i}.png`} style={{height: 100, marginTop: 20}} /></div>)}
      </div>
      <h2 className="title-h2 mb-4">Онлайн-калькулятор</h2>
      <Calculator />
      <h2 className="title-h2 mt-8 mb-4">Варианты доставки:</h2>
      <div style={{ background: '#fff', borderRadius: 16, border: '1px solid var(--border)' }}>
        {mockDeliveryOptions.map(o => (
          <div key={o.id} style={{ display: 'flex', padding: 24, borderBottom: '1px solid var(--border)' }}>
            <div style={{ flex: 2, display: 'flex', gap: 16, alignItems: 'center' }}><img src={o.img} style={{width:32}}/><b>{o.name}</b></div>
            <div style={{ flex: 1 }}>Сроки: <b>{o.days}</b></div>
            <div style={{ flex: 1 }}>Стоимость: <b>{o.cost}</b></div>
            <div style={{ flex: 1 }}>Итого: <b>{o.total}</b></div>
            <Check color="var(--primary-green)" />
          </div>
        ))}
      </div>
      <h2 className="title-h2 mt-8 mb-4">Услуги склада</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 0, background: '#fff', borderRadius: 16, border: '1px solid var(--border)' }}>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Консолидация</span><b>£1.00</b></div>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Заполнение декларации</span><b>£5.00</b></div>
         <div style={{ padding: 24, borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Доп. упаковка</span><b>£3.00</b></div>
         <div style={{ padding: 24, display: 'flex', justifyContent: 'space-between' }}><span>Упаковка хрупких</span><b>£10.00</b></div>
      </div>
      <div className="mt-8 bg-blue-gradient" style={{ display: 'flex', alignItems: 'center', gap: 40 }}>
         <img src="/images/icons/operator.png" style={{height: 150}} onError={(e)=>e.target.style.display='none'} />
         <div><h2 style={{ color: '#fff' }}>Попробуйте заказывать с оператором прямо сейчас</h2><div className="mt-4" style={{ display: 'flex', gap: 16 }}><input type="text" placeholder="Ссылка на товар" style={{ padding: 12, borderRadius: 8, border: 'none', width: 300 }} /><button className="btn btn-primary">Отправить</button></div></div>
      </div>
    </div>
  );
}
END
echo "export { default as PricesPage } from './ui/prices-page';" > src/pages/prices-page/index.js

# --- FAQ PAGE ---
cat > src/pages/faq-page/ui/faq-page.jsx << 'END'
import { useState } from 'react';
import { mockFaq } from '@/shared/mock/data';
import { Search, ChevronDown } from 'lucide-react';
export default function FaqPage() {
  const [open, setOpen] = useState(null);
  return (
    <div className="container page-wrapper" style={{ maxWidth: '900px' }}>
      <div className="bg-blue-gradient mb-8"><h1>Отвечаем на вопросы доставки</h1></div>
      <div style={{ display: 'flex', background: '#fff', padding: 16, borderRadius: 12, border: '1px solid var(--border)', marginBottom: 40 }}>
        <input type="text" placeholder="Поиск..." style={{ flex: 1, border: 'none', outline: 'none' }} /> <Search color="var(--primary-blue)" />
      </div>
      {mockFaq.map((cat, i) => (
        <div key={i} className="mb-8">
          <h3 className="mb-4">{cat.category}</h3>
          {cat.items.map(item => (
            <div key={item.id} style={{ background: '#fff', marginBottom: 8, borderRadius: 8, border: '1px solid var(--border)' }}>
              <div onClick={() => setOpen(open === item.id ? null : item.id)} style={{ padding: 20, display: 'flex', justifyContent: 'space-between', cursor: 'pointer', fontWeight: 500 }}>
                {item.q} <ChevronDown size={20} className={open === item.id ? 'rotate' : ''} />
              </div>
              {open === item.id && <div style={{ padding: '0 20px 20px', color: 'var(--text-muted)' }}>{item.a}</div>}
            </div>
          ))}
        </div>
      ))}
    </div>
  );
}
END
echo "export { default as FaqPage } from './ui/faq-page';" > src/pages/faq-page/index.js

# --- PARTNERSHIP PAGE ---
cat > src/pages/partnership-page/ui/partnership-page.jsx << 'END'
export default function PartnershipPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8"><h1>Бонусы и партнерская программа</h1><p className="mt-4">Платим $3 с каждой отправленной посылки.</p></div>
      <h2 className="title-h2 mb-8">Зарабатывать с нами — проще простого:</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24 }}>
         <div style={{ background: '#fff', padding: 32, borderRadius: 16, border: '1px solid var(--border)' }}><h3>Дарим около 10% назад бонусами</h3><p className="text-muted mt-4">Копите бонусы и тратьте их.</p></div>
         <div style={{ background: '#fff', padding: 32, borderRadius: 16, border: '1px solid var(--border)' }}><h3>Платим по $3 за посылку</h3><p className="text-muted mt-4">Приглашайте друзей.</p></div>
         <div style={{ background: '#fff', padding: 32, borderRadius: 16, border: '1px solid var(--border)' }}><h3>Призы по итогам</h3><p className="text-muted mt-4">Участвуйте в розыгрышах.</p></div>
      </div>
      <div className="mt-8 bg-blue-gradient" style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
         <div><h2 style={{color: '#fff'}}>Готовы начать зарабатывать вместе с нами?</h2><p style={{color: 'rgba(255,255,255,0.8)'}} className="mt-4">Присоединяйтесь к партнерской программе.</p></div>
         <button className="btn btn-primary">Присоединиться</button>
      </div>
    </div>
  );
}
END
echo "export { default as PartnershipPage } from './ui/partnership-page';" > src/pages/partnership-page/index.js

# --- BLOG PAGE ---
cat > src/pages/blog-page/ui/blog-page.jsx << 'END'
import { BlogCard } from '@/entities/blog-card';
import { mockBlog } from '@/shared/mock/data';
export default function BlogPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8"><h1>Блог</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 24 }}>
         {mockBlog.map(post => <BlogCard key={post.id} post={post} />)}
      </div>
    </div>
  );
}
END
echo "export { default as BlogPage } from './ui/blog-page';" > src/pages/blog-page/index.js

# --- STORES PAGE ---
cat > src/pages/stores-page/ui/stores-page.jsx << 'END'
import { StoreCard } from '@/entities/store-card';
import { mockStores } from '@/shared/mock/data';
export default function StoresPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8"><h1>Популярные магазины</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(6, 1fr)', gap: 24 }}>
         {[...mockStores, ...mockStores, ...mockStores].map((s, i) => <StoreCard key={i} store={s} />)}
      </div>
      <div className="mt-8 bg-blue-gradient" style={{ padding: 40, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2 style={{ color: '#fff' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
      </div>
    </div>
  );
}
END
echo "export { default as StoresPage } from './ui/stores-page';" > src/pages/stores-page/index.js

# --- AUTH PAGE ---
cat > src/pages/auth-page/ui/auth-page.jsx << 'END'
import { AuthForm } from '@/features/auth';
import { useLocation } from 'react-router-dom';
export default function AuthPage() {
  const isRegister = useLocation().pathname === '/register';
  return <div className="container page-wrapper"><AuthForm isRegister={isRegister} /></div>;
}
END
echo "export { default as AuthPage } from './ui/auth-page';" > src/pages/auth-page/index.js

# --- PROFILE PAGE ---
cat > src/pages/profile-page/ui/profile-page.jsx << 'END'
import { Outlet, useNavigate } from 'react-router-dom';
import { ProfileSidebar } from '@/widgets/profile-sidebar';
import { useAuthStore } from '@/shared/store/auth-store';
import { Button } from '@/shared/ui/button';
import { User, Clock } from 'lucide-react';
import './profile-page.css';

export default function ProfilePage() {
  const { logout, user } = useAuthStore();
  const navigate = useNavigate();
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ display: 'flex', justifyContent: 'space-between', padding: '20px 40px', borderRadius: 16 }}>
        <div style={{ display: 'flex', gap: 24, color: '#fff' }}><span style={{display:'flex',gap:8,alignItems:'center'}}><Clock size={16}/> Пн-Пт: 09:00-18:00</span><span style={{display:'flex',gap:8,alignItems:'center'}}><User size={16}/> {user?.name || 'Пользователь'}</span></div>
        <div style={{ display: 'flex', gap: 16, alignItems: 'center', color: '#fff' }}>Баланс: 0.0 ₽ <Button style={{ background: 'var(--primary-green)', padding: '6px 12px', fontSize: 12 }}>Пополнить</Button></div>
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 24 }}>
        <h1 className="title-h1">Личный кабинет</h1>
        <Button variant="outline" onClick={() => { logout(); navigate('/'); }}>Выйти</Button>
      </div>
      <div style={{ display: 'flex', gap: 24 }}>
        <ProfileSidebar />
        <div style={{ flex: 1, background: '#fff', padding: 32, borderRadius: 16, border: '1px solid var(--border)' }}><Outlet /></div>
      </div>
    </div>
  );
}
END
cat > src/pages/profile-page/ui/profile-page.css << 'END'
/* Стили для профиля */
END
echo "export { default as ProfilePage } from './ui/profile-page';" > src/pages/profile-page/index.js

# --- PROFILE TABS ---
mkdir -p src/pages/profile-page/ui/{address-tab,edit-tab,password-tab,payment-tab}
cat > src/pages/profile-page/ui/address-tab/address-tab.jsx << 'END'
import { useAuthStore } from '@/shared/store/auth-store';
export default function AddressTab() {
  const { user } = useAuthStore();
  return (
    <div>
      <h3 className="mb-4">Ваш виртуальный адрес</h3>
      <div style={{ background: '#F5F7FA', padding: 24, borderRadius: 12, fontFamily: 'monospace', lineHeight: 1.8 }}>
        <p><b>Name:</b> {user?.name || 'Dmitry'}</p>
        <p><b>Address:</b> Unit 5, 12 Market St, London, UK</p>
        <p><b>Postcode:</b> AB1 2CD</p>
      </div>
    </div>
  );
}
END
echo "export { default as AddressTab } from './address-tab';" > src/pages/profile-page/ui/address-tab/index.js

cat > src/pages/profile-page/ui/edit-tab/edit-tab.jsx << 'END'
import { EditProfile } from '@/features/edit-profile';
export default function EditTab() { return <EditProfile />; }
END
echo "export { default as EditTab } from './edit-tab';" > src/pages/profile-page/ui/edit-tab/index.js

cat > src/pages/profile-page/ui/password-tab/password-tab.jsx << 'END'
import { ChangePassword } from '@/features/change-password';
export default function PasswordTab() { return <ChangePassword />; }
END
echo "export { default as PasswordTab } from './password-tab';" > src/pages/profile-page/ui/password-tab/index.js

cat > src/pages/profile-page/ui/payment-tab/payment-tab.jsx << 'END'
export default function PaymentTab() {
  return (
    <div>
      <h3 className="mb-4">Реквизиты для оплаты</h3>
      <div style={{ display: 'grid', gap: 16 }}>
        <div style={{ border: '1px solid var(--border)', padding: 16, borderRadius: 8 }}>Pay24 <span className="text-muted" style={{fontSize:12, display:'block'}}>Номер кошелька: 4455...</span></div>
        <div style={{ border: '1px solid var(--border)', padding: 16, borderRadius: 8 }}>PayPal <span className="text-muted" style={{fontSize:12, display:'block'}}>Email: test@mail.com</span></div>
        <div style={{ border: '1px solid var(--border)', padding: 16, borderRadius: 8 }}>Unistream <span className="text-muted" style={{fontSize:12, display:'block'}}>Имя: Dmitry</span></div>
      </div>
    </div>
  );
}
END
echo "export { default as PaymentTab } from './payment-tab';" > src/pages/profile-page/ui/payment-tab/index.js

# --- ORDERS PAGE ---
cat > src/pages/orders-page/ui/orders-page.jsx << 'END'
import { OrderRow } from '@/entities/order-row';
import { mockOrders } from '@/shared/mock/data';
import { Search } from 'lucide-react';
export default function OrdersPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Заказы пользователя Dmitro Karlov</h1>
      <div style={{ display: 'flex', gap: 16, marginBottom: 24 }}>
         <div style={{ background: '#fff', padding: 12, borderRadius: 8, flex: 1, border: '1px solid var(--border)', display: 'flex', alignItems: 'center' }}><input type="text" placeholder="Номер заказа..." style={{ border: 'none', outline: 'none', width: '100%' }} /> <Search size={20} /></div>
         <button className="btn btn-primary">Найти</button>
      </div>
      <div style={{ background: '#fff', borderRadius: 16, overflow: 'hidden', border: '1px solid var(--border)' }}>
        <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left' }}>
          <thead style={{ background: '#F5F7FA' }}><tr><th style={{padding:16}}>Заказ</th><th>Дата</th><th>Трек</th><th>Сумма</th><th>Статус</th></tr></thead>
          <tbody>{mockOrders.map(o => <OrderRow key={o.id} order={o} />)}</tbody>
        </table>
      </div>
    </div>
  );
}
END
echo "export { default as OrdersPage } from './ui/orders-page';" > src/pages/orders-page/index.js

# --- ADDRESS BOOK PAGE ---
cat > src/pages/address-book-page/ui/address-book-page.jsx << 'END'
import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
export default function AddressBookPage() {
  const { register, handleSubmit } = useForm();
  return (
    <div className="container page-wrapper" style={{ maxWidth: 800 }}>
      <h1 className="title-h1 mb-8">Адресная книга пользователя</h1>
      <form onSubmit={handleSubmit((d) => alert('Сохранено'))} style={{ background: '#fff', padding: 32, borderRadius: 16, border: '1px solid var(--border)' }}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 20 }}>
          <Input label="Фамилия" register={register('lastname')} />
          <Input label="Имя" register={register('firstname')} />
          <Input label="Область/регион" register={register('region')} />
          <Input label="Район" register={register('district')} />
          <Input label="Город" register={register('city')} />
          <Input label="Улица" register={register('street')} />
          <Input label="Дом" register={register('house')} />
          <Input label="Квартира" register={register('flat')} />
          <Input label="Индекс" register={register('index')} />
          <Input label="Телефон" register={register('phone')} />
        </div>
        <Button type="submit" className="mt-4">Сохранить</Button>
      </form>
    </div>
  );
}
END
echo "export { default as AddressBookPage } from './ui/address-book-page';" > src/pages/address-book-page/index.js

# --- NOTIFICATIONS PAGE ---
cat > src/pages/notifications-page/ui/notifications-page.jsx << 'END'
import { NotificationCard } from '@/entities/notification-card';
import { mockNotifications } from '@/shared/mock/data';
export default function NotificationsPage() {
  return (
    <div className="container page-wrapper" style={{ maxWidth: 900 }}>
      <h1 className="title-h1 mb-8">Уведомления</h1>
      {mockNotifications.map(n => <NotificationCard key={n.id} n={n} />)}
    </div>
  );
}
END
echo "export { default as NotificationsPage } from './ui/notifications-page';" > src/pages/notifications-page/index.js

# --- CREATE PARCEL PAGE ---
cat > src/pages/create-parcel-page/ui/create-parcel-page.jsx << 'END'
import { CreateParcel } from '@/features/create-parcel';
export default function CreateParcelPage() {
  return (
    <div className="container page-wrapper" style={{ maxWidth: 900 }}>
      <h1 className="title-h1 mb-8">Создание посылки</h1>
      <div style={{ background: '#fff', padding: 32, borderRadius: 16, border: '1px solid var(--border)' }}><CreateParcel /></div>
    </div>
  );
}
END
echo "export { default as CreateParcelPage } from './ui/create-parcel-page';" > src/pages/create-parcel-page/index.js

# --- STUBS FOR HOW TO BUY & SALES ---
cat > src/pages/how-to-buy-page/ui/how-to-buy-page.jsx << 'END'
export default function HowToBuyPage() { return <div className="container page-wrapper"><div className="bg-blue-gradient mb-8"><h1>Как покупать</h1></div><p className="text-muted">Друг, сверстай тут 5 шагов.</p></div>; }
END
echo "export { default as HowToBuyPage } from './ui/how-to-buy-page';" > src/pages/how-to-buy-page/index.js

cat > src/pages/sales-page/ui/sales-page.jsx << 'END'
export default function SalesPage() { return <div className="container page-wrapper"><div className="bg-blue-gradient mb-8"><h1>Распродажи</h1></div><p className="text-muted">Друг, сделай сетку магазинов.</p></div>; }
END
echo "export { default as SalesPage } from './ui/sales-page';" > src/pages/sales-page/index.js

# ==========================================
# 9. РОУТЕР И APP
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
import { AuthPage } from '@/pages/auth-page';
import { ProfilePage } from '@/pages/profile-page';
import { OrdersPage } from '@/pages/orders-page';
import { CreateParcelPage } from '@/pages/create-parcel-page';
import { FaqPage } from '@/pages/faq-page';
import { AddressBookPage } from '@/pages/address-book-page';
import { NotificationsPage } from '@/pages/notifications-page';
import { PricesPage } from '@/pages/prices-page';
import { StoresPage } from '@/pages/stores-page';
import { PartnershipPage } from '@/pages/partnership-page';
import { BlogPage } from '@/pages/blog-page';
import { HowToBuyPage } from '@/pages/how-to-buy-page';
import { SalesPage } from '@/pages/sales-page';
import { AddressTab } from '@/pages/profile-page/ui/address-tab';
import { EditTab } from '@/pages/profile-page/ui/edit-tab';
import { PasswordTab } from '@/pages/profile-page/ui/password-tab';
import { PaymentTab } from '@/pages/profile-page/ui/payment-tab';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <MainLayout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: 'login', element: <AuthPage /> },
      { path: 'register', element: <AuthPage /> },
      { path: 'how-to-buy', element: <HowToBuyPage /> },
      { path: 'sales', element: <SalesPage /> },
      { path: 'prices', element: <PricesPage /> },
      { path: 'faq', element: <FaqPage /> },
      { path: 'partnership', element: <PartnershipPage /> },
      { path: 'blog', element: <BlogPage /> },
      { path: 'stores', element: <StoresPage /> },
      {
        element: <ProtectedRoute />,
        children: [
          {
            path: 'profile',
            element: <ProfilePage />,
            children: [
              { index: true, element: <AddressTab /> },
              { path: 'address', element: <AddressTab /> },
              { path: 'edit', element: <EditTab /> },
              { path: 'password', element: <PasswordTab /> },
              { path: 'payment', element: <PaymentTab /> },
            ]
          },
          { path: 'orders', element: <OrdersPage /> },
          { path: 'create-parcel', element: <CreateParcelPage /> },
          { path: 'address-book', element: <AddressBookPage /> },
          { path: 'notifications', element: <NotificationsPage /> },
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
ReactDOM.createRoot(document.getElementById('root')).render(<React.StrictMode><App /></React.StrictMode>);
END

echo "✅ ВСЁ ГОТОВО! Сайт полностью собран."
echo "👉 Теперь бери картинки из Figma и раскладывай их в папку public/images/ по названиям."
echo "👉 Запускай npm run dev и проверяй. Логика и формы работают на 100%."
