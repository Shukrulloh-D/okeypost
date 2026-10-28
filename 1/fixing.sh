#!/bin/bash
echo "🚀 ЗАПУСК ФИНАЛЬНОЙ СБОРКИ ВСЕХ СТРАНИЦ..."

# 1. ЖЕСТКО СОЗДАЕМ ВСЕ ПАПКИ (включая ui) — чтобы cat никогда не падал
mkdir -p src/app/{router,styles,layouts}
mkdir -p src/shared/{ui/button/ui,ui/input/ui,ui/select/ui,ui/checkbox/ui,ui/tabs/ui,store,mock}
mkdir -p src/features/{auth/ui,edit-profile/ui,change-password/ui,create-parcel/ui,calculator/ui}
mkdir -p src/entities/{order-row/ui,store-card/ui,blog-card/ui,notification-card/ui}
mkdir -p src/widgets/{header/ui,footer/ui,profile-sidebar/ui}
mkdir -p src/pages/{home-page,prices-page,faq-page,partnership-page,blog-page,stores-page,auth-page,orders-page,address-book-page,notifications-page,create-parcel-page,how-to-buy-page,sales-page}/ui
mkdir -p src/pages/profile-page/ui/{address-tab,info-tab,payment-tab}

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

# 3. МОКОВЫЕ ДАННЫЕ (Всё, что нужно)
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
  { id: 3, name: 'VLADIMIR E', stars: 5, text: 'Отзыв, как всегда! Отдельное спасибо за упаковку.', date: '16 Ноября 2021', city: 'Санкт-Петербург', img: '/images/reviews/3.png' },
  { id: 4, name: 'Оксана', stars: 5, text: 'Очень быстро, надежно! Как всегда большое спасибо!', date: '16 Ноября 2021', city: 'Odintsovo', img: '/images/reviews/4.png' },
];
export const mockStores = ['PRIMARK', 'H&M', 'MANGO', 'Next', 'Sports Direct', 'F&F', 'Accessorize', 'Adidas', 'Amazon', 'ASOS', 'Boohoo', 'Crocs', 'eBay', 'Matalan', 'Mothercare', 'New Look', 'Puma', 'Timberland', 'ZARA'];
export const mockSales = [
  { id: 1, shop: 'Abercrombie & Fitch', desc: 'Скидки до 50%', img: '/images/sales/1.png' },
  { id: 2, shop: 'Polo Ralph Lauren', desc: 'Скидки до 40%', img: '/images/sales/2.png' },
  { id: 3, shop: 'Michael Kors', desc: 'Black Friday Early Access', img: '/images/sales/3.png' },
  { id: 4, shop: "Victoria's Secret", desc: 'Скидки на комплекты', img: '/images/sales/4.png' },
  { id: 5, shop: 'Timberland', desc: 'Новая коллекция', img: '/images/sales/5.png' },
  { id: 6, shop: 'Hollister Co.', desc: 'Скидки до 50%', img: '/images/sales/6.png' },
];
export const mockBlog = [
  { id: 1, title: 'Интернет-магазин Urban Outfitters в UK: обзор', date: '22.10.2021', cat: 'Одежда', img: '/images/blog/1.png' },
  { id: 2, title: 'Overstock. Брендовые товары по доступным ценам', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/2.png' },
  { id: 3, title: 'Sneakers и Amazon. Удобная обувь для всей семьи', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/3.png' },
  { id: 4, title: '16 лучших подарков с Amazon в 2021 году', date: '22.10.2021', cat: 'Разное', img: '/images/blog/4.png' },
  { id: 5, title: 'Target — семейный супермаркет с ценами от 300 рублей', date: '22.10.2021', cat: 'Разное', img: '/images/blog/5.png' },
  { id: 6, title: 'Английский магазин RIPDIR. Покупаем с выгодой', date: '22.10.2021', cat: 'Одежда', img: '/images/blog/6.png' },
  { id: 7, title: 'Na-kd. Женские тренды из Англии по низким ценам', date: '22.10.2021', cat: 'Одежда', img: '/images/blog/7.png' },
  { id: 8, title: 'Farfetch 21 - лучшие цены на 1500 рублей', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/8.png' },
  { id: 9, title: 'Как купить кроссовки Balenciaga на 30 000 дешевле?', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/9.png' },
];
export const mockOrders = [
  { id: '12345', date: '15.10.2022', track: 'UK123456789', sum: '12 450 ₽', status: 'В пути' },
  { id: '12346', date: '18.10.2022', track: 'UK987654321', sum: '5 200 ₽', status: 'На складе' },
  { id: '12347', date: '20.10.2022', track: 'UK111222333', sum: '34 100 ₽', status: 'Доставлен' },
];
export const mockNotifications = [
  { id: 1, title: 'На складе в четверг 25 ноября выходной!', date: '25 Ноября', text: 'Уважаемые клиенты! Сообщаем вам...' },
  { id: 2, title: 'Выкуплен БЕСПЛАТНО с промокодом BF2021', date: '25 Ноября', text: 'Уважаемые клиенты! С 20.11...' },
];
export const mockFaq = [
  { category: 'Виртуальный адрес в Великобритании', items: [
    { id: 1, q: 'Что делать, если вы забыли внести трек-номер?', a: 'Свяжитесь с поддержкой.' }, { id: 2, q: 'Как я узнаю, что заказ пришел на склад?', a: 'Вам придет SMS.' },
    { id: 3, q: 'Сколько стоит виртуальный адрес?', a: 'Бесплатно.' }
  ]},
  { category: 'Покупки в магазинах Англии, скидки и промокода', items: [
    { id: 4, q: 'Анонс скидочных купонов и промокодов', a: 'В нашем блоге.' }, { id: 5, q: 'Как узнать пришел ли заказ полностью?', a: 'В личном кабинете.' }
  ]},
  { category: 'Доставка из Англии', items: [ { id: 6, q: 'Как часто вы отправляете посылки?', a: 'Еженедельно.' } ]},
  { category: 'Оплата', items: [ { id: 7, q: 'Где найти реквизиты для оплаты?', a: 'В личном кабинете.' } ]},
  { category: 'Общие вопросы', items: [ { id: 8, q: 'Какой ваш E-mail?', a: 'support@okeypost.com' } ]},
  { category: 'Посылки', items: [ { id: 9, q: 'Как отследить посылку?', a: 'По трек-номеру.' } ]},
];
END

# 4. SHARED UI & STORE
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

# 5. WIDGETS (Header, Footer, Sidebar)
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
          {isAuth ? <Link to="/profile"><User size={20}/></Link> : <Link to="/login"><User size={20}/> Вход</Link>}
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
      <NavLink to="/profile/address">Виртуальный адрес</NavLink><NavLink to="/profile/info">Информация о работе</NavLink><NavLink to="/profile/payment">Реквизиты для оплаты</NavLink>
      <NavLink to="/orders">Заказы</NavLink><NavLink to="/address-book">Адресная книга</NavLink><NavLink to="/notifications">Уведомления</NavLink>
    </aside>
  );
}
END
echo "export { default as ProfileSidebar } from './ui/profile-sidebar';" > src/widgets/profile-sidebar/index.js

# 6. FEATURES (Формы и логика)
cat > src/features/auth/ui/auth-form.jsx << 'END'
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
END
echo "export * from './ui/auth-form';" > src/features/auth/index.js

cat > src/features/calculator/ui/calculator.jsx << 'END'
import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { Select } from '@/shared/ui/select';
export const Calculator = () => {
  const [price, setPrice] = useState(null);
  const { register, handleSubmit } = useForm();
  return (
    <div style={{ background: '#fff', padding: '24px', borderRadius: '16px', border: '1px solid var(--border)' }}>
      <form onSubmit={handleSubmit((d) => setPrice(Math.round(500 + (d.weight || 0) * 200)))}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr 1fr 1fr', gap: '16px', alignItems: 'end' }}>
          <Select label="Страна" options={[{value:'ru', label:'Россия'}]} register={register('country')} />
          <Input label="Город" placeholder="Москва" register={register('city')} />
          <Input label="Индекс" placeholder="Введите индекс" register={register('index')} />
          <Input label="Вес посылки" type="number" placeholder="0.5" register={register('weight')} />
          <Select label="Доп. услуги" options={[{value:'none', label:'Выберите услуги'}]} register={register('services')} />
        </div>
        <Button type="submit" className="mt-4">Рассчитать</Button>
      </form>
      {price && <div className="mt-4" style={{ color: 'var(--primary-green)', fontSize: '24px', fontWeight: 'bold' }}>Стоимость: {price} ₽</div>}
    </div>
  );
};
END
echo "export * from './ui/calculator';" > src/features/calculator/index.js

# 7. ENTITIES (Карточки)
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

cat > src/entities/blog-card/ui/blog-card.jsx << 'END'
export default function BlogCard({ post }) {
  return <div style={{ background: '#fff', borderRadius: '16px', overflow: 'hidden', border: '1px solid var(--border)', cursor: 'pointer' }}><img src={post.img} style={{width:'100%', height: 200, objectFit:'cover', background: '#eee'}}/><div style={{padding:24}}><h3 style={{fontSize: 18, lineHeight:1.4, marginBottom:16}}>{post.title}</h3><div style={{display:'flex', justifyContent:'space-between', color:'var(--text-muted)', fontSize:13}}><span>{post.date}</span><span>{post.cat}</span></div></div></div>;
}
END
echo "export { default as BlogCard } from './ui/blog-card';" > src/entities/blog-card/index.js

cat > src/entities/notification-card/ui/notification-card.jsx << 'END'
export default function NotificationCard({ n }) {
  return (
    <div style={{ background: '#fff', padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
      <h4>{n.title}</h4><p className="text-muted mt-4">{n.text}</p><span style={{fontSize:12, color:'#999', marginTop:8, display:'block'}}>{n.date}</span>
    </div>
  );
}
END
echo "export { default as NotificationCard } from './ui/notification-card';" > src/entities/notification-card/index.js

# 8. PAGES (Все страницы сайта)
# --- HOME PAGE ---
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { Calculator } from '@/features/calculator';
import { mockCategories, mockDeliveryOptions, mockReviews } from '@/shared/mock/data';
import { Star } from 'lucide-react';
export default function HomePage() {
  return (
    <div>
      <div className="container mt-8"><div className="bg-blue-gradient" style={{display:'flex', justifyContent:'space-between', alignItems:'center'}}><div><h1 style={{fontSize: 48}}>Доставка товаров из Великобритании в Россию</h1><p className="mt-4">Начните экономить до 80% на шоппинге.</p><Button className="mt-8" style={{background:'#fff', color:'var(--primary-purple)'}}>Получить адрес в UK</Button></div><img src="/images/hero.png" style={{height: 300}} onError={(e)=>e.target.style.display='none'}/></div></div>
      
      <div className="container mt-8"><h2 className="title-h2 mb-4">Насколько выгодно покупать?</h2><div style={{display:'flex', justifyContent:'space-between', background:'#fff', padding:32, borderRadius:24}}>{mockCategories.map(c=><div key={c.id} style={{display:'flex', flexDirection:'column', alignItems:'center', gap:16}}><img src={c.img} style={{width:48, height:48}} onError={(e)=>e.target.style.display='none'}/><span>{c.name}</span></div>)}</div></div>
      
      <div className="container mt-8"><div style={{display:'flex', justifyContent:'space-between', alignItems:'center', background:'#fff', padding:60, borderRadius:36}}><div><h3 style={{fontSize:24}}>Columbia Barlow Pass 550 Turbodown Jacket</h3><div className="mt-4" style={{display:'flex', gap:16, background:'#F5F7FA', padding:16, borderRadius:16}}><span>🇷🇺</span><div><p className="text-muted" style={{fontSize:12}}>Цена в России</p><b>7891,46₽</b></div></div></div><div style={{width:300, height:300, background:'#F5F7FA', borderRadius:'50%', display:'flex', alignItems:'center', justifyContent:'center'}}><img src="/images/jacket.png" style={{maxWidth:'110%'}} onError={(e)=>e.target.style.display='none'}/></div><div style={{textAlign:'right'}}><h3 style={{fontSize:24}}>Доставка одежды из Великобритании <span style={{color:'var(--primary-green)'}}>от £7.79</span></h3><div className="mt-4" style={{display:'flex', gap:16, background:'#F5F7FA', padding:16, borderRadius:16, justifyContent:'flex-end'}}><div><p className="text-muted" style={{fontSize:12}}>Цена в UK</p><b>£80.62</b></div><span>🇬🇧</span></div></div></div></div>
      
      <div className="container mt-8"><h2 className="title-h2">OkeyPost удобная и быстрая доставка посылок</h2><Calculator /></div>
      
      <div className="container mt-8"><h3 className="title-h2 mb-4" style={{fontSize:24}}>Варианты доставки:</h3><div style={{background:'#fff', borderRadius:16, border:'1px solid var(--border)'}}>{mockDeliveryOptions.map(o=><div key={o.id} style={{display:'flex', padding:24, borderBottom:'1px solid var(--border)'}}><div style={{flex:2, display:'flex', gap:16}}><img src={o.img} style={{width:32}} onError={(e)=>e.target.style.display='none'}/><b>{o.name}</b></div><div style={{flex:1}}>Сроки: {o.days}</div><div style={{flex:1}}>Стоимость: {o.cost}</div><div style={{flex:1}}>Итого: {o.total}</div></div>)}</div></div>
      
      <div className="container mt-8"><div className="bg-blue-gradient" style={{display:'flex', justifyContent:'space-between', alignItems:'center', padding:40}}><img src="/images/virtual-tour.png" style={{height:150}} onError={(e)=>e.target.style.display='none'}/><div><h2 style={{color:'#fff'}}>Виртуальный тур по нашему складу</h2><p style={{color:'rgba(255,255,255,0.8)'}} className="mt-4">Вы можете всегда посмотреть на нашу слаженную работу.</p><Button className="mt-4">Попробовать</Button></div></div></div>

      <div className="container mt-8"><h2 className="title-h2">120 000 довольных клиентов в России</h2><div style={{display:'grid', gridTemplateColumns:'1fr 1fr', gap:24}}>{mockReviews.map(r=><div key={r.id} style={{background:'#fff', padding:24, borderRadius:16, display:'flex', gap:16}}><img src={r.img} style={{width:100, height:100, borderRadius:12}} onError={(e)=>e.target.style.background='#eee'}/><div><h4>{r.name}</h4><div style={{color:'#FFB800'}}>★★★★★</div><p className="text-muted mt-4">{r.text}</p></div></div>)}</div></div>
      
      <div className="container mt-8"><div className="bg-blue-gradient" style={{display:'flex', justifyContent:'space-between', alignItems:'center', padding:40}}><h2 style={{color:'#fff', maxWidth:600}}>Подпишитесь и будьте в курсе всех скидок и акций!</h2><div style={{display:'flex', gap:16}}><input type="text" placeholder="Email" style={{padding:16, borderRadius:8, border:'none'}}/><Button style={{background:'#fff', color:'var(--primary-purple)'}}>Подписаться</Button></div></div></div>
    </div>
  );
}
END
echo "export { default as HomePage } from './ui/home-page';" > src/pages/home-page/index.js

# --- HOW TO BUY ---
cat > src/pages/how-to-buy-page/ui/how-to-buy-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
export default function HowToBuyPage() {
  const steps = [
    { id: 1, title: 'ПОЛУЧАЕТЕ АДРЕС ДЛЯ ПОКУПОК', desc: 'В английском магазине, оплачиваете и указываете адрес склада.', img: '/images/steps/1.png' },
    { id: 2, title: 'ИДЕТЕ ЗА ПОКУПКАМИ', desc: 'В английском магазине, оплачиваете и указываете адрес склада.', img: '/images/steps/2.png' },
    { id: 3, title: 'СЛЕДИТЕ ЗА ПЕРЕМЕЩЕНИЕМ', desc: 'В английском магазине, оплачиваете и указываете адрес склада.', img: '/images/steps/3.png' },
    { id: 4, title: 'ОПЛАЧИВАЕТЕ ДОСТАВКУ', desc: 'В английском магазине, оплачиваете и указываете адрес склада.', img: '/images/steps/4.png' },
    { id: 5, title: 'ПОЛУЧАЕТЕ ПОСЫЛКУ', desc: 'В английском магазине, оплачиваете и указываете адрес склада.', img: '/images/steps/5.png' },
  ];
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Научим покупать в Великобритании!</h1><Button className="mt-4" style={{ background: '#fff', color: 'var(--primary-purple)' }}>Получить адрес в UK</Button></div>
      <h2 className="title-h2 mb-8">Покупать в Великобритании очень просто</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '60px' }}>
        <div>
          <p className="text-muted mb-8">Английские магазины не доставляют в Россию, но это не проблема. С OkeyPost можно покупать по лучшим ценам и экономить до 70%.</p>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '40px' }}>
            {steps.map(step => (
              <div key={step.id} style={{ display: 'flex', gap: '24px' }}>
                <div style={{ color: 'var(--primary-green)', fontSize: '36px', fontWeight: 700, opacity: 0.5 }}>0{step.id}</div>
                <div><h4 style={{ fontSize: '16px', fontWeight: 700, marginBottom: '8px' }}>{step.title}</h4><p className="text-muted" style={{ fontSize: '14px' }}>{step.desc}</p></div>
              </div>
            ))}
          </div>
        </div>
        <div style={{ position: 'relative' }}>
           <img src="/images/how-to-buy-illustration.png" style={{ width: '100%', position: 'sticky', top: '100px' }} onError={(e)=>e.target.style.display='none'} />
        </div>
      </div>
    </div>
  );
}
END
echo "export { default as HowToBuyPage } from './ui/how-to-buy-page';" > src/pages/how-to-buy-page/index.js

# --- SALES ---
cat > src/pages/sales-page/ui/sales-page.jsx << 'END'
import { mockSales } from '@/shared/mock/data';
import { Button } from '@/shared/ui/button';
export default function SalesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}><h1 style={{ fontSize: '32px' }}>Распродажи</h1><p className="mt-4">Ранний доступ к распродажам в магазинах</p><Button className="mt-4" style={{ background: 'rgba(255,255,255,0.2)' }}>Получить адрес в UK</Button></div>
      <h2 className="title-h2 mb-8">Black Friday Early Access<br/>ранний доступ к распродажам в магазинах Великобритании!</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '40px' }}>
        {mockSales.map(item => (
          <div key={item.id} style={{ background: '#fff', padding: '24px', borderRadius: '16px', display: 'flex', gap: '24px', border: '1px solid var(--border)' }}>
            <img src={item.img} alt={item.shop} style={{ width: '180px', height: '180px', objectFit: 'cover', borderRadius: '12px', background: '#eee' }} onError={(e) => e.target.style.background='#ddd'} />
            <div style={{ flex: 1 }}><h3 style={{ fontSize: '20px', marginBottom: '12px' }}>{item.shop}</h3><p className="text-muted mb-4" style={{ fontSize: '14px' }}>{item.desc}</p><a href="#" style={{ color: 'var(--primary-blue)', fontSize: '14px', fontWeight: 500 }}>Товары в магазине →</a></div>
          </div>
        ))}
      </div>
    </div>
  );
}
END
echo "export { default as SalesPage } from './ui/sales-page';" > src/pages/sales-page/index.js

# --- PRICES ---
cat > src/pages/prices-page/ui/prices-page.jsx << 'END'
import { Calculator } from '@/features/calculator';
import { mockDeliveryOptions } from '@/shared/mock/data';
import { Check } from 'lucide-react';
export default function PricesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8"><h1>Услуги доставки из Великобритании</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 24, marginBottom: 48 }}>
        {[1,2,3,4].map(i => <div key={i} style={{ background: '#fff', padding: 24, borderRadius: 16, border: '1px solid var(--border)' }}><h3>Услуга {i}</h3><p className="text-muted mt-4">Описание услуги</p><img src={`/images/icons/service${i}.png`} style={{height: 100, marginTop: 20}} onError={(e)=>e.target.style.display='none'}/></div>)}
      </div>
      <h2 className="title-h2 mb-4">Калькулятор</h2><Calculator />
      <h2 className="title-h2 mt-8 mb-4">Варианты доставки:</h2>
      <div style={{ background: '#fff', borderRadius: 16, border: '1px solid var(--border)' }}>
        {mockDeliveryOptions.map(o => (
          <div key={o.id} style={{ display: 'flex', padding: 24, borderBottom: '1px solid var(--border)' }}>
            <div style={{ flex: 2, display: 'flex', gap: 16 }}><img src={o.img} style={{width:32}} onError={(e)=>e.target.style.display='none'}/><b>{o.name}</b></div>
            <div style={{ flex: 1 }}>Сроки: {o.days}</div><div style={{ flex: 1 }}>Стоимость: {o.cost}</div><div style={{ flex: 1 }}>Итого: {o.total}</div><Check color="var(--primary-green)" />
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
    </div>
  );
}
END
echo "export { default as PricesPage } from './ui/prices-page';" > src/pages/prices-page/index.js

# --- FAQ ---
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

# --- PARTNERSHIP ---
cat > src/pages/partnership-page/ui/partnership-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
export default function PartnershipPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}><h1 style={{ fontSize: '32px' }}>Бонусы и партнерская программа</h1><p className="mt-4">Платим $3 с каждой отправленной посылки</p></div>
      <h2 className="title-h2 mb-8">Зарабатывать с нами — проще простого:</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px', marginBottom: '40px' }}>
        {[{ t: 'Дарим около 10% назад бонусами', d: 'Копите бонусы и тратьте их.' }, { t: 'Платим по $3 за посылку', d: 'Приглашайте друзей.' }, { t: 'Призы по итогам', d: 'Участвуйте в розыгрышах.' }, { t: 'Выплаты на карту', d: 'Выводите деньги.' }].map((item, i) => (
          <div key={i} style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)' }}><h3 style={{ fontSize: '18px', marginBottom: '12px' }}>{item.t}</h3><p className="text-muted" style={{ fontSize: '14px' }}>{item.d}</p></div>
        ))}
      </div>
      <div className="bg-blue-gradient" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div><h2 style={{ color: '#fff', fontSize: '28px' }}>Готовы начать зарабатывать?</h2></div>
        <Button style={{ background: '#fff', color: 'var(--primary-purple)' }}>Присоединиться</Button>
      </div>
    </div>
  );
}
END
echo "export { default as PartnershipPage } from './ui/partnership-page';" > src/pages/partnership-page/index.js

# --- BLOG ---
cat > src/pages/blog-page/ui/blog-page.jsx << 'END'
import { mockBlog } from '@/shared/mock/data';
import { BlogCard } from '@/entities/blog-card';
export default function BlogPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Блог</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '32px' }}>
        {mockBlog.map(post => <BlogCard key={post.id} post={post} />)}
      </div>
    </div>
  );
}
END
echo "export { default as BlogPage } from './ui/blog-page';" > src/pages/blog-page/index.js

# --- STORES ---
cat > src/pages/stores-page/ui/stores-page.jsx << 'END'
import { mockStores } from '@/shared/mock/data';
export default function StoresPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Популярные магазины</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(6, 1fr)', gap: '24px' }}>
        {mockStores.map((store, i) => (
          <div key={i} style={{ background: '#fff', height: '120px', borderRadius: '16px', display: 'flex', alignItems: 'center', justifyContent: 'center', border: '1px solid var(--border)' }}><span style={{ fontWeight: 700, color: '#ccc' }}>{store}</span></div>
        ))}
      </div>
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderRadius: '24px' }}><h2 style={{ color: '#fff' }}>Остались вопросы?</h2></div>
    </div>
  );
}
END
echo "export { default as StoresPage } from './ui/stores-page';" > src/pages/stores-page/index.js

# --- AUTH PAGE (Login/Register) ---
cat > src/pages/auth-page/ui/auth-page.jsx << 'END'
import { AuthForm } from '@/features/auth';
import { useLocation } from 'react-router-dom';
export default function AuthPage() { const isReg = useLocation().pathname === '/register'; return <div className="container page-wrapper"><AuthForm isRegister={isReg} /></div>; }
END
echo "export { default as AuthPage } from './ui/auth-page';" > src/pages/auth-page/index.js

# --- PROFILE PAGE ---
cat > src/pages/profile-page/ui/profile-page.jsx << 'END'
import { Outlet, useNavigate } from 'react-router-dom';
import { ProfileSidebar } from '@/widgets/profile-sidebar';
import { useAuthStore } from '@/shared/store/auth-store';
import { Button } from '@/shared/ui/button';
export default function ProfilePage() {
  const { logout, user } = useAuthStore();
  const navigate = useNavigate();
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ display: 'flex', justifyContent: 'space-between', padding: '20px 40px', borderRadius: 16 }}><span>{user?.name || 'Dmitro Karlov'}</span><Button onClick={() => { logout(); navigate('/'); }}>Выйти</Button></div>
      <div style={{ display: 'flex', gap: 24 }}><ProfileSidebar /><div style={{ flex: 1, background: '#fff', padding: 32, borderRadius: 16, border: '1px solid var(--border)' }}><Outlet /></div></div>
    </div>
  );
}
END
echo "export { default as ProfilePage } from './ui/profile-page';" > src/pages/profile-page/index.js

cat > src/pages/profile-page/ui/address-tab/address-tab.jsx << 'END'
export default function AddressTab() {
  return (
    <div>
      <h3 className="mb-4">Ваш виртуальный адрес</h3>
      <div style={{ display: 'grid', gap: '8px' }}>
        {[ {l: 'Ваш ID Клиента', v: 'OK5556A654654'}, {l: 'Name, Surname', v: 'Karlov Dmitro OK5556...'}, {l: 'First line of address', v: 'Unit 5 Cromwell Estate'}, {l: 'Country', v: 'London'}, {l: 'Postcode', v: 'E10 7QE'}, {l: 'Town, City', v: 'London'}, {l: 'Country', v: 'Great Britain'}, {l: 'Telephone', v: '0730882545'} ].map((row, i) => (
          <div key={i} style={{ display: 'flex', background: '#F5F7FA', padding: '12px 16px', borderRadius: 8, fontSize: 14 }}><span style={{ width: 200, color: 'var(--text-muted)' }}>{row.l}:</span><span>{row.v}</span></div>
        ))}
      </div>
    </div>
  );
}
END
echo "export { default as AddressTab } from './address-tab';" > src/pages/profile-page/ui/address-tab/index.js

cat > src/pages/profile-page/ui/info-tab/info-tab.jsx << 'END'
export default function InfoTab() {
  return (
    <div>
      <h3 className="mb-4">Информация о работе</h3>
      <div style={{ display: 'grid', gap: '8px' }}>
        <div style={{ display: 'flex', background: '#F5F7FA', padding: '12px 16px', borderRadius: 8, fontSize: 14 }}><span style={{ width: 200, color: 'var(--text-muted)' }}>Номер телефона:</span><span>+44 20 7946 0958</span></div>
        <div style={{ display: 'flex', background: '#F5F7FA', padding: '12px 16px', borderRadius: 8, fontSize: 14 }}><span style={{ width: 200, color: 'var(--text-muted)' }}>E-mail:</span><span>dmitro.karlov@gmail.com</span></div>
      </div>
    </div>
  );
}
END
echo "export { default as InfoTab } from './info-tab';" > src/pages/profile-page/ui/info-tab/index.js

cat > src/pages/profile-page/ui/payment-tab/payment-tab.jsx << 'END'
import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
export default function PaymentTab() {
  const { register } = useForm();
  return (
    <div>
      <h3 className="mb-8" style={{ fontSize: '20px' }}>Реквизиты для оплаты</h3>
      <div style={{ display: 'grid', gap: '16px' }}>
        <div><h4 style={{marginBottom: 8}}>Pay24</h4><div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px' }}>Номер кошелька: 4405XXXXXXXXX</div></div>
        <div><h4 style={{marginBottom: 8}}>PayPal</h4><div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px' }}>Email: test@okeypost.com</div></div>
        <div><h4 style={{marginBottom: 8}}>Unistream</h4><div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px', display:'grid', gap:8 }}><div style={{display:'flex', justifyContent:'space-between'}}><span>Name</span><span className="text-muted">Dmitro Karlov</span></div><div style={{display:'flex', justifyContent:'space-between'}}><span>Tel</span><span className="text-muted">+44 20 7946 0958</span></div></div></div>
        <div><h4 style={{marginBottom: 8}}>SWIFT</h4><div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px', display:'grid', gap:8 }}><div style={{display:'flex', justifyContent:'space-between'}}><span>IBAN</span><span className="text-muted">GB29 NWBK 6016 1331 9268 19</span></div><div style={{display:'flex', justifyContent:'space-between'}}><span>Банк</span><span className="text-muted">National Westminster Bank</span></div></div></div>
      </div>
    </div>
  );
}
END
echo "export { default as PaymentTab } from './payment-tab';" > src/pages/profile-page/ui/payment-tab/index.js

# --- ORDERS ---
cat > src/pages/orders-page/ui/orders-page.jsx << 'END'
import { OrderRow } from '@/entities/order-row';
import { mockOrders } from '@/shared/mock/data';
export default function OrdersPage() { return <div className="container page-wrapper"><h1 className="title-h1 mb-8">Заказы</h1><div style={{background:'#fff', borderRadius:16, border:'1px solid var(--border)'}}><table style={{width:'100%', borderCollapse:'collapse'}}><thead><tr style={{background:'#F5F7FA'}}><th style={{padding:16}}>Заказ</th><th>Дата</th><th>Трек</th><th>Сумма</th><th>Статус</th></tr></thead><tbody>{mockOrders.map(o=><OrderRow key={o.id} order={o}/>)}</tbody></table></div></div>; }
END
echo "export { default as OrdersPage } from './ui/orders-page';" > src/pages/orders-page/index.js

# --- ADDRESS BOOK ---
cat > src/pages/address-book-page/ui/address-book-page.jsx << 'END'
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { useForm } from 'react-hook-form';
export default function AddressBookPage() {
  const { register, handleSubmit } = useForm();
  return (
    <div className="container page-wrapper" style={{ maxWidth: '1000px' }}>
      <h1 className="title-h1 mb-8">Адресная книга</h1>
      <form onSubmit={handleSubmit(()=>alert('Сохранено'))} style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)' }}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
          <Input label="Фамилия" register={register('surname')} /><Input label="Имя" register={register('name')} />
          <Input label="Область/регион" register={register('region')} /><Input label="Район" register={register('district')} />
          <Input label="Город" register={register('city')} /><Input label="Улица" register={register('street')} />
          <Input label="Дом" register={register('house')} /><Input label="Квартира" register={register('flat')} />
          <Input label="Индекс" register={register('index')} /><Input label="Телефон" register={register('phone')} />
        </div>
        <Button type="submit" className="mt-8">Сохранить</Button>
      </form>
    </div>
  );
}
END
echo "export { default as AddressBookPage } from './ui/address-book-page';" > src/pages/address-book-page/index.js

# --- NOTIFICATIONS ---
cat > src/pages/notifications-page/ui/notifications-page.jsx << 'END'
import { NotificationCard } from '@/entities/notification-card';
import { mockNotifications } from '@/shared/mock/data';
import { AlertTriangle } from 'lucide-react';
export default function NotificationsPage() {
  return (
    <div className="container page-wrapper" style={{ maxWidth: '1000px' }}>
      <h1 className="title-h1 mb-8">Уведомления</h1>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
        {mockNotifications.map(n => <NotificationCard key={n.id} n={n} />)}
      </div>
      <div style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)', marginTop: '32px', display: 'flex', gap: '24px' }}>
        <div style={{ background: '#FFFBEB', padding: '12px', borderRadius: '50%', color: '#D97706' }}><AlertTriangle size={24} /></div>
        <div><h3 style={{ fontSize: '18px', marginBottom: '8px' }}>Про таможенные лимиты:</h3><p className="text-muted" style={{ fontSize: '14px', lineHeight: 1.6 }}>С 1 января 2020 года беспошлинный лимит в России составляет 200 евро. При превышении необходимо оплатить пошлину в размере 15% от суммы превышения.</p><button className="btn btn-primary mt-4">Подробнее</button></div>
      </div>
    </div>
  );
}
END
echo "export { default as NotificationsPage } from './ui/notifications-page';" > src/pages/notifications-page/index.js

# --- CREATE PARCEL ---
cat > src/pages/create-parcel-page/ui/create-parcel-page.jsx << 'END'
import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
export default function CreateParcelPage() {
  const { register } = useForm();
  return (
    <div className="container page-wrapper" style={{ maxWidth: '900px' }}>
      <h1 className="title-h1 mb-8">Создание посылки</h1>
      <div style={{ background: '#fff', padding: 32, borderRadius: 16 }}>
        <p className="text-muted mb-8">Трек-номер (не более 10 символов)</p>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 20 }}>
          <Input label="Трек-номер" register={register('track')} placeholder="UK123456" />
          <Input label="Название магазина" register={register('shop')} placeholder="H&M" />
        </div>
        <p className="text-muted mt-8 mb-4">Доп. услуги:</p>
        <div style={{ display: 'flex', gap: 24, marginBottom: 24 }}>
           <label><input type="checkbox" /> Консолидация</label>
           <label><input type="checkbox" /> Усиленная упаковка</label>
           <label><input type="checkbox" /> Проверка вложений</label>
        </div>
        <Button>Создать посылку</Button>
      </div>
    </div>
  );
}
END
echo "export { default as CreateParcelPage } from './ui/create-parcel-page';" > src/pages/create-parcel-page/index.js

# 9. ROUTER & APP
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
import { InfoTab } from '@/pages/profile-page/ui/info-tab';
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
              { path: 'info', element: <InfoTab /> },
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

echo "✅ ВСЁ ГОТОВО! Сайт полностью собран и работает."
echo "👉 Запускай npm run dev"
