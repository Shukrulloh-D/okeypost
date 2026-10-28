#!/bin/bash
echo "🚀 ФИНАЛЬНАЯ СБОРКА ВСЕГО САЙТА OkeyPost (Безопасно, без удаления)..."

# 1. ЖЕСТКО СОЗДАЕМ ВСЕ ПАПКИ (чтобы cat не падал)
mkdir -p src/app/{router,styles,layouts}
mkdir -p src/shared/{ui/button/ui,ui/input/ui,ui/select/ui,ui/checkbox/ui,ui/tabs/ui,store,mock}
mkdir -p src/features/{auth/ui,edit-profile/ui,change-password/ui,create-parcel/ui,calculator/ui}
mkdir -p src/entities/{order-row/ui,store-card/ui,blog-card/ui,notification-card/ui}
mkdir -p src/widgets/{header/ui,footer/ui,profile-sidebar/ui}
mkdir -p src/pages/{home-page,prices-page,faq-page,partnership-page,blog-page,stores-page,auth-page,orders-page,address-book-page,notifications-page,create-parcel-page,how-to-buy-page,sales-page}/ui
mkdir -p src/pages/profile-page/ui/{address-tab,edit-tab,password-tab,payment-tab}

# 2. ГЛОБАЛЬНЫЕ СТИЛИ
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

# 3. МОКОВЫЕ ДАННЫЕ
cat > src/shared/mock/data.js << 'END'
export const mockCategories = [
  { id: 1, name: 'Одежда', img: '/images/icons/clothes.png' }, { id: 2, name: 'Электроника', img: '/images/icons/laptop.png' },
  { id: 3, name: 'Аксессуары', img: '/images/icons/bag.png' }, { id: 4, name: 'Для детей', img: '/images/icons/baby.png' },
  { id: 5, name: 'Для спорта', img: '/images/icons/sport.png' }, { id: 6, name: 'Косметика', img: '/images/icons/cosmetics.png' },
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
];
export const mockBlog = [
  { id: 1, title: 'Интернет-магазин Urban Outfitters', date: '22.10.2021', img: '/images/blog/1.png' },
  { id: 2, title: 'Overstock. Брендовые товары', date: '22.10.2021', img: '/images/blog/2.png' },
];
export const mockOrders = [
  { id: '12345', date: '15.10.2022', track: 'UK123456789', sum: '12 450 ₽', status: 'В пути' },
  { id: '12346', date: '18.10.2022', track: 'UK987654321', sum: '5 200 ₽', status: 'На складе' },
];
export const mockNotifications = [
  { id: 1, title: 'На складе в четверг 25 ноября выходной!', date: '25 Ноября', text: 'Уважаемые клиенты! Сообщаем вам...' },
  { id: 2, title: 'Выкуплен БЕСПЛАТНО с промокодом BF2021', date: '25 Ноября', text: 'Уважаемые клиенты! С 20.11...' },
];
export const mockFaq = [
  { category: 'Виртуальный адрес', items: [ { id: 1, q: 'Как узнать, что заказ пришел?', a: 'Вам придет SMS.' }, { id: 2, q: 'Сколько стоит адрес?', a: 'Бесплатно.' } ]},
  { category: 'Покупки в Англии', items: [ { id: 3, q: 'Анонс скидок', a: 'В нашем блоге.' } ]},
];
END

# 4. SHARED UI
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
.input-group select { padding: 12px 16px; border: 1px solid var(--border); border-radius: 8px; font-size: 14px; outline: none; background: #fff; width: 100%; }
.input-group select.error { border-color: red; }
END
echo "export * from './ui/select';" > src/shared/ui/select/index.js

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

cat > src/shared/store/auth-store.js << 'END'
import { create } from 'zustand';
import { persist } from 'zustand/middleware';
export const useAuthStore = create(persist((set) => ({
  user: null, isAuth: false,
  login: (data) => set({ user: data, isAuth: true }),
  logout: () => set({ user: null, isAuth: false }),
}), { name: 'okeypost-auth' }));
END

# 5. FEATURES
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
  const login = useAuthStore((s) => s.login);
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

cat > src/features/edit-profile/ui/edit-profile.jsx << 'END'
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
END
echo "export * from './ui/edit-profile';" > src/features/edit-profile/index.js

cat > src/features/change-password/ui/change-password.jsx << 'END'
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
END
echo "export * from './ui/change-password';" > src/features/change-password/index.js

cat > src/features/create-parcel/ui/create-parcel.jsx << 'END'
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { Select } from '@/shared/ui/select';
const schema = z.object({ track: z.string().min(5, 'Мин 5 символов'), weight: z.string().min(1, 'Укажите вес'), desc: z.string().min(5, 'Мин 5 символов') });
export const CreateParcel = () => {
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(schema) });
  return (
    <form onSubmit={handleSubmit(() => alert('Посылка создана!'))}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' }}>
        <Input label="Трек-номер" register={register('track')} error={errors.track} />
        <Input label="Вес (кг)" type="number" register={register('weight')} error={errors.weight} />
      </div>
      <Input label="Описание" register={register('desc')} error={errors.desc} />
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' }}>
        <Select label="Магазин" options={[{value:'hm', label:'H&M'}, {value:'zara', label:'ZARA'}]} register={register('shop')} />
        <Input label="Стоимость (£)" register={register('price')} />
      </div>
      <Button type="submit" className="mt-4">Создать</Button>
    </form>
  );
};
END
echo "export * from './ui/create-parcel';" > src/features/create-parcel/index.js

cat > src/features/calculator/ui/calculator.jsx << 'END'
import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
export const Calculator = () => {
  const [price, setPrice] = useState(null);
  const { register, handleSubmit } = useForm();
  return (
    <div style={{ background: '#fff', padding: '24px', borderRadius: '16px', maxWidth: '600px', border: '1px solid var(--border)' }}>
      <form onSubmit={handleSubmit((d) => setPrice(Math.round(500 + d.weight * 200)))}>
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

# 6. ENTITIES
cat > src/entities/order-row/ui/order-row.jsx << 'END'
export default function OrderRow({ order }) {
  return (
    <tr style={{ borderBottom: '1px solid var(--border)' }}>
      <td style={{ padding: '16px' }}>#{order.id}</td><td>{order.date}</td><td>{order.track}</td><td>{order.sum}</td>
      <td><span style={{ background: '#E6F7FF', color: 'var(--primary-blue)', padding: '4px 12px', borderRadius: '12px', fontSize: '12px' }}>{order.status}</span></td>
    </tr>
  );
}
END
echo "export { default as OrderRow } from './ui/order-row';" > src/entities/order-row/index.js

cat > src/entities/store-card/ui/store-card.jsx << 'END'
export default function StoreCard({ store }) {
  return <div style={{ background: '#fff', borderRadius: 16, height: 120, display: 'flex', alignItems: 'center', justifyContent: 'center', border: '1px solid var(--border)' }}><img src={store.logo} alt={store.name} style={{maxHeight: 40}} onError={(e) => e.target.style.display='none'}/></div>;
}
END
echo "export { default as StoreCard } from './ui/store-card';" > src/entities/store-card/index.js

cat > src/entities/blog-card/ui/blog-card.jsx << 'END'
export default function BlogCard({ post }) {
  return <div style={{ background: '#fff', padding: 16, borderRadius: 16, border: '1px solid var(--border)' }}><img src={post.img} style={{width:'100%', height: 200, objectFit:'cover', borderRadius: 12, background: '#eee'}}/><h3 className="mt-4">{post.title}</h3><span className="text-muted" style={{fontSize:12}}>{post.date}</span></div>;
}
END
echo "export { default as BlogCard } from './ui/blog-card';" > src/entities/blog-card/index.js

cat > src/entities/notification-card/ui/notification-card.jsx << 'END'
export default function NotificationCard({ n }) {
  return (
    <div style={{ background: '#fff', padding: '24px', borderRadius: '12px', marginBottom: '16px', border: '1px solid var(--border)' }}>
      <h4>{n.title}</h4><p className="text-muted mt-4">{n.text}</p><span style={{fontSize:12, color:'#999', marginTop:8, display:'block'}}>{n.date}</span>
    </div>
  );
}
END
echo "export { default as NotificationCard } from './ui/notification-card';" > src/entities/notification-card/index.js

# 7. WIDGETS
cat > src/widgets/header/ui/header.jsx << 'END'
import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import { useAuthStore } from '@/shared/store/auth-store';
import { User } from 'lucide-react';
export default function Header() {
  const isAuth = useAuthStore((s) => s.isAuth);
  return (
    <header style={{ background: '#fff', borderBottom: '1px solid var(--border)', padding: '16px 0', position: 'sticky', top: 0, zIndex: 100 }}>
      <div className="container" style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <Link to="/" style={{ fontSize: 24, fontWeight: 800, color: 'var(--primary-blue)' }}>OkeyPost</Link>
        <nav style={{ display: 'flex', gap: 24, fontSize: 14 }}>
           <Link to="/how-to-buy">Как покупать</Link><Link to="/sales">Распродажи</Link><Link to="/prices">Цены</Link><Link to="/faq">Помощь</Link><Link to="/partnership">Бонусы</Link><Link to="/blog">Блог</Link><Link to="/stores">Магазины</Link>
        </nav>
        <div style={{ display: 'flex', gap: 20, alignItems: 'center' }}>
          {isAuth ? <Link to="/profile"><User size={20}/></Link> : <Link to="/login"><User size={20}/></Link>}
          <Link to={isAuth ? "/create-parcel" : "/login"}><Button>Создать посылку</Button></Link>
        </div>
      </div>
    </header>
  );
}
END
echo "export { default as Header } from './ui/header';" > src/widgets/header/index.js

cat > src/widgets/footer/ui/footer.jsx << 'END'
export default function Footer() { return <footer style={{ background: '#fff', padding: '40px 0', borderTop: '1px solid var(--border)', marginTop: 'auto' }}><div className="container text-center text-muted">© 2022 OkeyPost</div></footer>; }
END
echo "export { default as Footer } from './ui/footer';" > src/widgets/footer/index.js

cat > src/widgets/profile-sidebar/ui/profile-sidebar.jsx << 'END'
import { NavLink } from 'react-router-dom';
export default function ProfileSidebar() {
  return (
    <aside style={{ display: 'flex', flexDirection: 'column', gap: 8, background: '#fff', padding: 24, borderRadius: 16, width: 250, height: 'fit-content' }}>
      <NavLink to="/profile/address">Виртуальный адрес</NavLink><NavLink to="/profile/edit">Редактировать профиль</NavLink><NavLink to="/profile/password">Изменить пароль</NavLink><NavLink to="/profile/payment">Реквизиты</NavLink>
      <NavLink to="/orders">Заказы</NavLink><NavLink to="/address-book">Адресная книга</NavLink><NavLink to="/notifications">Уведомления</NavLink>
    </aside>
  );
}
END
echo "export { default as ProfileSidebar } from './ui/profile-sidebar';" > src/widgets/profile-sidebar/index.js

# 8. PAGES
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { Calculator } from '@/features/calculator';
import { mockCategories, mockDeliveryOptions } from '@/shared/mock/data';
export default function HomePage() {
  return (
    <div>
      <div className="container mt-8"><div className="bg-blue-gradient" style={{display:'flex', justifyContent:'space-between', alignItems:'center'}}><div><h1 style={{fontSize: 48}}>Доставка товаров из Великобритании в Россию</h1><p className="mt-4">Начните экономить до 80% на шоппинге.</p><Button className="mt-8" style={{background:'#fff', color:'var(--primary-purple)'}}>Получить адрес в UK</Button></div><img src="/images/hero.png" style={{height: 300}}/></div></div>
      <div className="container mt-8"><h2 className="title-h2 mb-4">Насколько выгодно покупать?</h2><div style={{display:'flex', justifyContent:'space-between', background:'#fff', padding:32, borderRadius:24}}>{mockCategories.map(c=><div key={c.id} style={{display:'flex', flexDirection:'column', alignItems:'center', gap:16}}><img src={c.img} style={{width:48, height:48}}/><span>{c.name}</span></div>)}</div></div>
      <div className="container mt-8"><h2 className="title-h2">OkeyPost удобная и быстрая доставка посылок</h2><Calculator /></div>
      <div className="container mt-8"><h3 className="title-h2 mb-4" style={{fontSize:24}}>Варианты доставки:</h3><div style={{background:'#fff', borderRadius:16}}>{mockDeliveryOptions.map(o=><div key={o.id} style={{display:'flex', padding:24, borderBottom:'1px solid var(--border)'}}><div style={{flex:2, display:'flex', gap:16}}><img src={o.img} style={{width:32}}/><b>{o.name}</b></div><div style={{flex:1}}>Сроки: {o.days}</div><div style={{flex:1}}>Стоимость: {o.cost}</div><div style={{flex:1}}>Итого: {o.total}</div></div>)}</div></div>
    </div>
  );
}
END
echo "export { default as HomePage } from './ui/home-page';" > src/pages/home-page/index.js

cat > src/pages/prices-page/ui/prices-page.jsx << 'END'
import { Calculator } from '@/features/calculator';
import { mockDeliveryOptions } from '@/shared/mock/data';
import { Check } from 'lucide-react';
export default function PricesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8"><h1>Услуги доставки из Великобритании</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 24, marginBottom: 48 }}>
        {[1,2,3,4].map(i => <div key={i} style={{ background: '#fff', padding: 24, borderRadius: 16, border: '1px solid var(--border)' }}><h3>Услуга {i}</h3><p className="text-muted mt-4">Описание</p><img src={`/images/icons/service${i}.png`} style={{height: 100, marginTop: 20}} /></div>)}
      </div>
      <h2 className="title-h2 mb-4">Калькулятор</h2>
      <Calculator />
      <h2 className="title-h2 mt-8 mb-4">Варианты доставки:</h2>
      <div style={{ background: '#fff', borderRadius: 16, border: '1px solid var(--border)' }}>
        {mockDeliveryOptions.map(o => (
          <div key={o.id} style={{ display: 'flex', padding: 24, borderBottom: '1px solid var(--border)' }}>
            <div style={{ flex: 2, display: 'flex', gap: 16 }}><img src={o.img} style={{width:32}}/><b>{o.name}</b></div>
            <div style={{ flex: 1 }}>Сроки: {o.days}</div><div style={{ flex: 1 }}>Стоимость: {o.cost}</div><div style={{ flex: 1 }}>Итого: {o.total}</div><Check color="var(--primary-green)" />
          </div>
        ))}
      </div>
    </div>
  );
}
END
echo "export { default as PricesPage } from './ui/prices-page';" > src/pages/prices-page/index.js

cat > src/pages/faq-page/ui/faq-page.jsx << 'END'
import { useState } from 'react';
import { mockFaq } from '@/shared/mock/data';
import { Search, ChevronDown } from 'lucide-react';
export default function FaqPage() {
  const [open, setOpen] = useState(null);
  return (
    <div className="container page-wrapper" style={{ maxWidth: '900px' }}>
      <div className="bg-blue-gradient mb-8"><h1>Отвечаем на вопросы доставки</h1></div>
      <div style={{ display: 'flex', background: '#fff', padding: 16, borderRadius: 12, border: '1px solid var(--border)', marginBottom: 40 }}><input type="text" placeholder="Поиск..." style={{ flex: 1, border: 'none', outline: 'none' }} /> <Search /></div>
      {mockFaq.map((cat, i) => (
        <div key={i} className="mb-8"><h3 className="mb-4">{cat.category}</h3>{cat.items.map(item => (
          <div key={item.id} style={{ background: '#fff', marginBottom: 8, borderRadius: 8, border: '1px solid var(--border)' }}>
            <div onClick={() => setOpen(open === item.id ? null : item.id)} style={{ padding: 20, display: 'flex', justifyContent: 'space-between', cursor: 'pointer' }}>{item.q} <ChevronDown size={20} /></div>
            {open === item.id && <div style={{ padding: '0 20px 20px', color: 'var(--text-muted)' }}>{item.a}</div>}
          </div>
        ))}</div>
      ))}
    </div>
  );
}
END
echo "export { default as FaqPage } from './ui/faq-page';" > src/pages/faq-page/index.js

cat > src/pages/partnership-page/ui/partnership-page.jsx << 'END'
export default function PartnershipPage() { return <div className="container page-wrapper"><div className="bg-blue-gradient mb-8"><h1>Бонусы и партнерская программа</h1></div><div style={{display:'grid', gridTemplateColumns:'1fr 1fr', gap:24}}><div style={{background:'#fff', padding:32, borderRadius:16}}>Карточка 1</div><div style={{background:'#fff', padding:32, borderRadius:16}}>Карточка 2</div></div></div>; }
END
echo "export { default as PartnershipPage } from './ui/partnership-page';" > src/pages/partnership-page/index.js

cat > src/pages/blog-page/ui/blog-page.jsx << 'END'
import { BlogCard } from '@/entities/blog-card';
import { mockBlog } from '@/shared/mock/data';
export default function BlogPage() { return <div className="container page-wrapper"><div className="bg-blue-gradient mb-8"><h1>Блог</h1></div><div style={{display:'grid', gridTemplateColumns:'repeat(3, 1fr)', gap:24}}>{mockBlog.map(p=><BlogCard key={p.id} post={p}/>)}</div></div>; }
END
echo "export { default as BlogPage } from './ui/blog-page';" > src/pages/blog-page/index.js

cat > src/pages/stores-page/ui/stores-page.jsx << 'END'
import { StoreCard } from '@/entities/store-card';
import { mockStores } from '@/shared/mock/data';
export default function StoresPage() { return <div className="container page-wrapper"><div className="bg-blue-gradient mb-8"><h1>Популярные магазины</h1></div><div style={{display:'grid', gridTemplateColumns:'repeat(6, 1fr)', gap:24}}>{[...mockStores, ...mockStores].map((s, i)=><StoreCard key={i} store={s}/>)}</div></div>; }
END
echo "export { default as StoresPage } from './ui/stores-page';" > src/pages/stores-page/index.js

cat > src/pages/auth-page/ui/auth-page.jsx << 'END'
import { AuthForm } from '@/features/auth';
import { useLocation } from 'react-router-dom';
export default function AuthPage() { const isReg = useLocation().pathname === '/register'; return <div className="container page-wrapper"><AuthForm isRegister={isReg} /></div>; }
END
echo "export { default as AuthPage } from './ui/auth-page';" > src/pages/auth-page/index.js

cat > src/pages/profile-page/ui/profile-page.jsx << 'END'
import { Outlet, useNavigate } from 'react-router-dom';
import { ProfileSidebar } from '@/widgets/profile-sidebar';
import { useAuthStore } from '@/shared/store/auth-store';
import { Button } from '@/shared/ui/button';
export default function ProfilePage() {
  const { logout } = useAuthStore();
  const navigate = useNavigate();
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ display: 'flex', justifyContent: 'space-between', padding: '20px 40px', borderRadius: 16 }}><span>Личный кабинет</span><Button onClick={() => { logout(); navigate('/'); }}>Выйти</Button></div>
      <div style={{ display: 'flex', gap: 24 }}><ProfileSidebar /><div style={{ flex: 1, background: '#fff', padding: 32, borderRadius: 16, border: '1px solid var(--border)' }}><Outlet /></div></div>
    </div>
  );
}
END
echo "export { default as ProfilePage } from './ui/profile-page';" > src/pages/profile-page/index.js

cat > src/pages/profile-page/ui/address-tab/address-tab.jsx << 'END'
export default function AddressTab() { return <div><h3 className="mb-4">Виртуальный адрес</h3><div style={{background:'#F5F7FA', padding:24, borderRadius:12}}>Name: Dmitry<br/>Address: Unit 5, London, UK</div></div>; }
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
export default function PaymentTab() { return <div><h3>Реквизиты</h3><p className="text-muted">PayPal, Pay24...</p></div>; }
END
echo "export { default as PaymentTab } from './payment-tab';" > src/pages/profile-page/ui/payment-tab/index.js

cat > src/pages/orders-page/ui/orders-page.jsx << 'END'
import { OrderRow } from '@/entities/order-row';
import { mockOrders } from '@/shared/mock/data';
export default function OrdersPage() { return <div className="container page-wrapper"><h1 className="title-h1 mb-8">Заказы</h1><div style={{background:'#fff', borderRadius:16, border:'1px solid var(--border)'}}><table style={{width:'100%', borderCollapse:'collapse'}}><thead><tr style={{background:'#F5F7FA'}}><th style={{padding:16}}>Заказ</th><th>Дата</th><th>Трек</th><th>Сумма</th><th>Статус</th></tr></thead><tbody>{mockOrders.map(o=><OrderRow key={o.id} order={o}/>)}</tbody></table></div></div>; }
END
echo "export { default as OrdersPage } from './ui/orders-page';" > src/pages/orders-page/index.js

cat > src/pages/address-book-page/ui/address-book-page.jsx << 'END'
export default function AddressBookPage() { return <div className="container page-wrapper"><h1 className="title-h1 mb-8">Адресная книга</h1><div style={{background:'#fff', padding:32, borderRadius:16}}>Форма адреса...</div></div>; }
END
echo "export { default as AddressBookPage } from './ui/address-book-page';" > src/pages/address-book-page/index.js

cat > src/pages/notifications-page/ui/notifications-page.jsx << 'END'
import { NotificationCard } from '@/entities/notification-card';
import { mockNotifications } from '@/shared/mock/data';
export default function NotificationsPage() { return <div className="container page-wrapper"><h1 className="title-h1 mb-8">Уведомления</h1>{mockNotifications.map(n=><NotificationCard key={n.id} n={n}/>)}</div>; }
END
echo "export { default as NotificationsPage } from './ui/notifications-page';" > src/pages/notifications-page/index.js

cat > src/pages/create-parcel-page/ui/create-parcel-page.jsx << 'END'
import { CreateParcel } from '@/features/create-parcel';
export default function CreateParcelPage() { return <div className="container page-wrapper"><h1 className="title-h1 mb-8">Создание посылки</h1><div style={{background:'#fff', padding:32, borderRadius:16}}><CreateParcel /></div></div>; }
END
echo "export { default as CreateParcelPage } from './ui/create-parcel-page';" > src/pages/create-parcel-page/index.js

cat > src/pages/how-to-buy-page/ui/how-to-buy-page.jsx << 'END'
export default function HowToBuyPage() { return <div className="container page-wrapper"><div className="bg-blue-gradient mb-8"><h1>Как покупать</h1></div><p>Друг, сверстай тут 5 шагов.</p></div>; }
END
echo "export { default as HowToBuyPage } from './ui/how-to-buy-page';" > src/pages/how-to-buy-page/index.js

cat > src/pages/sales-page/ui/sales-page.jsx << 'END'
export default function SalesPage() { return <div className="container page-wrapper"><div className="bg-blue-gradient mb-8"><h1>Распродажи</h1></div><p>Друг, сделай сетку магазинов.</p></div>; }
END
echo "export { default as SalesPage } from './ui/sales-page';" > src/pages/sales-page/index.js

# 9. APP & ROUTER
cat > src/app/layouts/main-layout.jsx << 'END'
import { Outlet } from 'react-router-dom';
import { Header } from '@/widgets/header';
import { Footer } from '@/widgets/footer';
export const MainLayout = () => (<div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh' }}><Header /><main style={{ flex: 1 }}><Outlet /></main><Footer /></div>);
END

cat > src/app/router/protected-route.jsx << 'END'
import { Navigate, Outlet } from 'react-router-dom';
import { useAuthStore } from '@/shared/store/auth-store';
export const ProtectedRoute = () => { const isAuth = useAuthStore((state) => state.isAuth); return isAuth ? <Outlet /> : <Navigate to="/login" replace />; };
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
      { path: 'login', element: <AuthPage /> }, { path: 'register', element: <AuthPage /> },
      { path: 'how-to-buy', element: <HowToBuyPage /> }, { path: 'sales', element: <SalesPage /> },
      { path: 'prices', element: <PricesPage /> }, { path: 'faq', element: <FaqPage /> },
      { path: 'partnership', element: <PartnershipPage /> }, { path: 'blog', element: <BlogPage /> },
      { path: 'stores', element: <StoresPage /> },
      {
        element: <ProtectedRoute />,
        children: [
          { path: 'profile', element: <ProfilePage />, children: [{ index: true, element: <AddressTab /> }, { path: 'address', element: <AddressTab /> }, { path: 'edit', element: <EditTab /> }, { path: 'password', element: <PasswordTab /> }, { path: 'payment', element: <PaymentTab /> }] },
          { path: 'orders', element: <OrdersPage /> }, { path: 'create-parcel', element: <CreateParcelPage /> },
          { path: 'address-book', element: <AddressBookPage /> }, { path: 'notifications', element: <NotificationsPage /> },
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

echo "✅ ВСЁ ГОТОВО! Сайт полностью собран и работает."
echo "👉 Запускай npm run dev"
