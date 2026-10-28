#!/bin/bash
echo "🔥 МЕГА-ФИКС №3: Добавляем всё пропущенное, починяем футер и наполняем контентом..."

# ==========================================
# 1. ПОЧИНКА ФУТЕРА (Он пропал из-за ошибки в Layout)
# ==========================================
mkdir -p src/widgets/footer/ui
cat > src/widgets/footer/ui/footer.jsx << 'END'
import { Link } from 'react-router-dom';
import './footer.css';
export default function Footer() {
  return (
    <footer className="footer">
      <div className="container footer-grid">
        <div>
          <h2 style={{color: 'var(--primary-blue)', fontWeight: 800, marginBottom: 16}}>OkeyPost</h2>
          <div style={{display: 'flex', gap: 16, color: 'var(--text-muted)'}}>
            <a href="#">WhatsApp</a> <a href="#">Telegram</a> <a href="#">Viber</a>
          </div>
        </div>
        <div>
          <h4>О компании</h4>
          <Link to="/">Услуги</Link>
          <Link to="/">Цены</Link>
          <Link to="/">Отзывы</Link>
          <Link to="/">Контакты</Link>
          <Link to="/">Вакансии</Link>
          <Link to="/">Соглашение о персональных данных</Link>
          <Link to="/">Условия использования</Link>
        </div>
        <div>
          <h4>Полезное</h4>
          <Link to="/">Как работает наш сервис</Link>
          <Link to="/">Как покупать с оператором</Link>
          <Link to="/">Ответы на частые вопросы</Link>
          <Link to="/">Популярные магазины</Link>
          <Link to="/">Черный список магазинов</Link>
          <Link to="/">Актуальные распродажи</Link>
        </div>
        <div>
          <h4>Спецпроекты</h4>
          <Link to="/">50% на первую доставку</Link>
          <Link to="/">Скидки для постоянных клиентов</Link>
          <Link to="/">Реферальная программа</Link>
          <Link to="/">Кэшбек Mr. Rebates и Rakuten</Link>
          <Link to="/">Stop Fraud</Link>
        </div>
      </div>
      <div className="container footer-bottom">
        <p>© 2022 OkeyPost. Все права защищены.</p>
      </div>
    </footer>
  );
}
END
cat > src/widgets/footer/ui/footer.css << 'END'
.footer { background: #fff; border-top: 1px solid var(--border); padding: 60px 0 20px; margin-top: 80px; }
.footer-grid { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 40px; margin-bottom: 40px; }
.footer-grid h4 { margin-bottom: 20px; font-size: 16px; font-weight: 600; }
.footer-grid a { display: block; color: var(--text-muted); margin-bottom: 12px; font-size: 14px; transition: 0.2s;}
.footer-grid a:hover { color: var(--primary-blue); }
.footer-bottom { border-top: 1px solid var(--border); padding-top: 20px; text-align: center; color: var(--text-muted); font-size: 12px;}
@media (max-width: 992px) { .footer-grid { grid-template-columns: 1fr 1fr; } }
END
echo "export { default as Footer } from './ui/footer';" > src/widgets/footer/index.js

# ИСПРАВЛЯЕМ LAYOUT, ЧТОБЫ ФУТЕР БЫЛ ВНИЗУ
mkdir -p src/app/layouts
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

# ==========================================
# 2. ОБНОВЛЕНИЕ ДАННЫХ (Больше карточек!)
# ==========================================
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

// 25 магазинов
export const mockStores = ['PRIMARK', 'H&M', 'MANGO', 'Next', 'Sports Direct', 'F&F', 'Accessorize', 'Adidas', 'Amazon', 'ASOS', 'Boohoo', 'Crocs', 'eBay', 'Matalan', 'Mothercare', 'New Look', 'Puma', 'Timberland', 'ZARA', 'Clarks', 'M&S', 'Tucci', 'Zulily', 'Panache', 'Betterware'];

// 10 распродаж
export const mockSales = [
  { id: 1, shop: 'Abercrombie & Fitch', desc: 'Скидки до 50%', img: '/images/sales/1.png' },
  { id: 2, shop: 'Polo Ralph Lauren', desc: 'Скидки до 40%', img: '/images/sales/2.png' },
  { id: 3, shop: 'Michael Kors', desc: 'Black Friday Early Access', img: '/images/sales/3.png' },
  { id: 4, shop: "Victoria's Secret", desc: 'Скидки на комплекты', img: '/images/sales/4.png' },
  { id: 5, shop: 'Timberland', desc: 'Новая коллекция', img: '/images/sales/5.png' },
  { id: 6, shop: 'Hollister Co.', desc: 'Скидки до 50%', img: '/images/sales/6.png' },
  { id: 7, shop: 'Levi\'s', desc: 'Скидки 30% на джинсы', img: '/images/sales/7.png' },
  { id: 8, shop: 'UGG', desc: 'Вход с VPN', img: '/images/sales/8.png' },
  { id: 9, shop: 'New Balance', desc: 'Скидки 50%', img: '/images/sales/9.png' },
  { id: 10, shop: 'Ayrner Saks OFF 5TH', desc: 'Black Friday', img: '/images/sales/10.png' },
];

// 12 блогов
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
  { id: 10, title: 'Tom Ford. Самые дорогие сумки Louis Vuitton', date: '22.10.2021', cat: 'Разное', img: '/images/blog/10.png' },
  { id: 11, title: 'BH Cosmetics Galaxy. Косметика красоты и ухода', date: '22.10.2021', cat: 'Разное', img: '/images/blog/11.png' },
  { id: 12, title: '"Васюки". Крутые кеды, которые не выйдут из моды никогда!', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/12.png' },
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
  { category: 'Виртуальный адрес в Великобритании', items: [ { id: 1, q: 'Что делать, если вы забыли внести трек-номер?', a: 'Свяжитесь с поддержкой.' }, { id: 2, q: 'Как я узнаю, что заказ пришел на склад?', a: 'Вам придет SMS.' }, { id: 3, q: 'Сколько стоит виртуальный адрес?', a: 'Бесплатно.' } ]},
  { category: 'Покупки в магазинах Англии', items: [ { id: 4, q: 'Анонс скидочных купонов и промокодов', a: 'В нашем блоге.' }, { id: 5, q: 'Как узнать пришел ли заказ полностью?', a: 'В личном кабинете.' } ]},
];
END

# ==========================================
# 3. ГЛАВНАЯ СТРАНИЦА (Добавляем ВСЁ пропущенное)
# ==========================================
mkdir -p src/pages/home-page/ui
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { Calculator } from '@/features/calculator';
import { mockCategories, mockDeliveryOptions, mockReviews } from '@/shared/mock/data';
import { Star } from 'lucide-react';

export default function HomePage() {
  return (
    <div>
      {/* HERO */}
      <div className="container mt-8">
        <div className="bg-blue-gradient" style={{display:'flex', justifyContent:'space-between', alignItems:'center'}}>
          <div><h1 style={{fontSize: 48}}>Доставка товаров из Великобритании в Россию</h1><p className="mt-4">Начните экономить до 80% на шоппинге.</p><Button className="mt-8" style={{background:'#fff', color:'var(--primary-purple)'}}>Получить адрес в UK</Button></div>
          <img src="/images/hero.png" style={{height: 300}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
      
      {/* КАТЕГОРИИ */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">Насколько выгодно покупать?</h2>
        <div style={{display:'flex', justifyContent:'space-between', background:'#fff', padding:32, borderRadius:24, border: '1px solid var(--border)'}}>
          {mockCategories.map(c=><div key={c.id} style={{display:'flex', flexDirection:'column', alignItems:'center', gap:16}}><img src={c.img} style={{width:48, height:48}} onError={(e)=>e.target.style.display='none'}/><span>{c.name}</span></div>)}
        </div>
      </div>
      
      {/* КУРТКА */}
      <div className="container mt-8">
        <div style={{display:'flex', justifyContent:'space-between', alignItems:'center', background:'#fff', padding:60, borderRadius:36, border: '1px solid var(--border)'}}>
          <div style={{flex: 1}}>
            <h3 style={{fontSize:24}}>Columbia Barlow Pass 550 Turbodown Jacket</h3>
            <div className="mt-4" style={{display:'flex', gap:16, background:'#F5F7FA', padding:16, borderRadius:16, alignItems: 'center', width: 'fit-content'}}><img src="/images/icons/flag-ru.png" style={{width: 32}} onError={(e)=>e.target.style.display='none'}/><div><p className="text-muted" style={{fontSize:12}}>Цена в России</p><b>7891,46₽</b></div></div>
          </div>
          <div style={{flex: 1, display: 'flex', justifyContent: 'center', position: 'relative'}}>
            <img src="/images/jacket.png" style={{maxWidth:'100%', height: 300}} onError={(e)=>e.target.style.display='none'}/>
          </div>
          <div style={{flex: 1, textAlign:'right'}}>
            <h3 style={{fontSize:24}}>Доставка одежды из Великобритании <span style={{color:'var(--primary-green)'}}>от £7.79</span></h3>
            <div className="mt-4" style={{display:'flex', gap:16, background:'#F5F7FA', padding:16, borderRadius:16, justifyContent:'flex-end', alignItems: 'center', width: 'fit-content', marginLeft: 'auto'}}><div><p className="text-muted" style={{fontSize:12}}>Цена в UK</p><b>£80.62</b></div><img src="/images/icons/flag-uk.png" style={{width: 32}} onError={(e)=>e.target.style.display='none'}/></div>
          </div>
        </div>
        <div style={{display: 'flex', justifyContent: 'space-between', padding: '0 60px', marginTop: 24}}>
          <img src="/images/icons/tshirt.png" style={{height: 80}} onError={(e)=>e.target.style.display='none'}/>
          <p className="text-muted" style={{textAlign: 'center'}}>Срок доставки примерно 10 дней<br/><b style={{color: '#1A1A1A', fontSize: 18}}>Вы экономите до <span style={{color: 'var(--primary-green)'}}>$119.56</span></b></p>
          <img src="/images/icons/jeans.png" style={{height: 80}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>

      {/* БЛОК МАСТЕРОВ (Пропущенный) */}
      <div className="container mt-8">
        <div className="bg-blue-gradient" style={{display:'flex', alignItems:'center', padding: 40, gap: 40}}>
          <img src="/images/master.png" style={{height: 200}} onError={(e)=>e.target.style.display='none'}/>
          <div>
            <h2 style={{color: '#fff', fontSize: 28}}>Поручите нашим мастерам оформление заказов в английских магазинах</h2>
            <p style={{color: 'rgba(255,255,255,0.8)', marginTop: 12, marginBottom: 24}}>Такой способ покупки также подойдет, если магазин принимает только английские карты.</p>
            <Button style={{background: 'var(--primary-green)'}}>Попробовать</Button>
          </div>
        </div>
      </div>

      {/* КАЛЬКУЛЯТОР */}
      <div className="container mt-8">
        <h2 className="title-h2">OkeyPost удобная и быстрая доставка посылок</h2>
        <Calculator />
      </div>
      
      {/* ВАРИАНТЫ ДОСТАВКИ */}
      <div className="container mt-8">
        <h3 className="title-h2 mb-4" style={{fontSize:24}}>Варианты доставки:</h3>
        <div style={{background:'#fff', borderRadius:16, border:'1px solid var(--border)'}}>
          {mockDeliveryOptions.map(o=><div key={o.id} style={{display:'flex', padding:24, borderBottom:'1px solid var(--border)'}}><div style={{flex:2, display:'flex', gap:16, alignItems: 'center'}}><img src={o.img} style={{width:32}} onError={(e)=>e.target.style.display='none'}/><b>{o.name}</b></div><div style={{flex:1}}>Сроки: {o.days}</div><div style={{flex:1}}>Стоимость: {o.cost}</div><div style={{flex:1}}>Итого: {o.total}</div></div>)}
        </div>
      </div>

      {/* 4 ПРОСТЫХ ШАГА (Пропущенный) */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-8">4 простых шага для ваших покупок в Великобритании</h2>
        <div style={{display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 24}}>
          {[1, 2, 3, 4].map(i => (
             <div key={i}>
               <img src={`/images/steps/step${i}.png`} style={{height: 150, objectFit: 'contain', display: 'block', margin: '0 auto'}} onError={(e)=>e.target.style.display='none'}/>
               <h4 style={{fontSize: 14, textTransform: 'uppercase', marginTop: 24, marginBottom: 8, fontWeight: 700}}>Шаг {i}</h4>
               <p className="text-muted" style={{fontSize: 13}}>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
             </div>
          ))}
        </div>
      </div>

      {/* ВИРТУАЛЬНЫЙ ТУР */}
      <div className="container mt-8">
        <div className="bg-blue-gradient" style={{display:'flex', alignItems:'center', padding: 40, gap: 40}}>
          <img src="/images/virtual-tour.png" style={{height: 150}} onError={(e)=>e.target.style.display='none'}/>
          <div><h2 style={{color:'#fff'}}>Виртуальный тур по нашему складу</h2><p style={{color:'rgba(255,255,255,0.8)'}} className="mt-4">Вы можете всегда посмотреть на нашу слаженную работу.</p><Button className="mt-4" style={{background:'var(--primary-green)'}}>Попробовать</Button></div>
        </div>
      </div>

      {/* ОТЗЫВЫ */}
      <div className="container mt-8">
        <h2 className="title-h2">120 000 довольных клиентов в России</h2>
        <div style={{display:'grid', gridTemplateColumns:'1fr 1fr', gap:24, marginTop: 24}}>
          {mockReviews.map(r=><div key={r.id} style={{background:'#fff', padding:24, borderRadius:16, display:'flex', gap:16, border: '1px solid var(--border)'}}><img src={r.img} style={{width:100, height:100, borderRadius:12}} onError={(e)=>e.target.style.background='#eee'}/><div><h4>{r.name}</h4><div style={{color:'#FFB800', display: 'flex'}}>{[...Array(r.stars)].map((_, i) => <Star key={i} size={14} fill="#FFB800" />)}</div><p className="text-muted mt-4" style={{fontSize:14}}>{r.text}</p><span style={{fontSize:12, color:'#999', marginTop: 12, display:'block'}}>Дата: {r.date} <br/> Город: {r.city}</span></div></div>)}
        </div>
      </div>

      {/* ЛИЧНЫЙ АДРЕС (Пропущенный) */}
      <div className="container mt-8" style={{maxWidth: 900}}>
        <h2 className="title-h2 mb-4">Ваш личный адрес в Великобритании для покупок</h2>
        <p className="text-muted" style={{lineHeight: 1.8, marginBottom: 16}}>С нами вы получаете целых два адреса в UK! У нас есть два склада для приема посылок – в Лондоне и Манчестере.</p>
        <p className="text-muted" style={{lineHeight: 1.8, marginBottom: 16}}>При доставке из UK в Россию все ваши товары обязательно страхуются. Прием посылок на наш склад, их обработка, удаление лишних коробок, хранение сроком до 70 дней – у нас полностью бесплатно.</p>
        <p className="text-muted" style={{lineHeight: 1.8}}>У нас самая выгодная доставка! От $11.99 за посылку! А если у вас есть какие-то особенные требования, вроде проверки техники или дополнительной пленки для самых хрупких товаров, – операторы нашего склада с радостью выполнят их по спецзапросу.</p>
      </div>

      {/* ПОДПИСКА */}
      <div className="container mt-8">
        <div className="bg-blue-gradient" style={{display:'flex', justifyContent:'space-between', alignItems:'center', padding:40}}>
          <h2 style={{color:'#fff', maxWidth:600}}>Подпишитесь и будьте в курсе всех скидок и акций магазинов Великобритании!</h2>
          <div style={{display:'flex', gap:16}}>
            <input type="text" placeholder="Введите ваш email" style={{padding:16, borderRadius:8, border:'none', width: 250}}/>
            <Button style={{background:'var(--primary-green)'}}>Подписаться</Button>
          </div>
        </div>
      </div>
    </div>
  );
}
END
echo "export { default as HomePage } from './ui/home-page';" > src/pages/home-page/index.js

# ==========================================
# 4. КАК ПОКУПАТЬ (Доработка)
# ==========================================
mkdir -p src/pages/how-to-buy-page/ui
cat > src/pages/how-to-buy-page/ui/how-to-buy-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
export default function HowToBuyPage() {
  const steps = [
    { id: 1, title: 'ПОЛУЧАЕТЕ АДРЕС ДЛЯ ПОКУПОК', desc: 'Зарегистрируйтесь на сайте и получите адрес склада в Великобритании.', img: '/images/steps/step1.png' },
    { id: 2, title: 'ИДЕТЕ ЗА ПОКУПКАМИ', desc: 'Выбираете товары в английских магазинах, оплачиваете и указываете адрес склада.', img: '/images/steps/step2.png' },
    { id: 3, title: 'СЛЕДИТЕ ЗА ПЕРЕМЕЩЕНИЕМ', desc: 'Отслеживайте статус посылки в личном кабинете.', img: '/images/steps/step3.png' },
    { id: 4, title: 'ОПЛАЧИВАЕТЕ ДОСТАВКУ', desc: 'Выбираете способ доставки из UK в Россию и оплачиваете.', img: '/images/steps/step4.png' },
    { id: 5, title: 'ПОЛУЧАЕТЕ ПОСЫЛКУ', desc: 'Забираете посылку в пункте выдачи или ждете курьера.', img: '/images/steps/step5.png' },
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
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2 style={{ color: '#fff', fontSize: '28px' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
      </div>
    </div>
  );
}
END
echo "export { default as HowToBuyPage } from './ui/how-to-buy-page';" > src/pages/how-to-buy-page/index.js

# ==========================================
# 5. РАСПРОДАЖИ (10 карточек + низ)
# ==========================================
mkdir -p src/pages/sales-page/ui
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
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2 style={{ color: '#fff', fontSize: '28px' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
      </div>
    </div>
  );
}
END
echo "export { default as SalesPage } from './ui/sales-page';" > src/pages/sales-page/index.js

# ==========================================
# 6. ЦЕНЫ (Доделываем все блоки)
# ==========================================
mkdir -p src/pages/prices-page/ui
cat > src/pages/prices-page/ui/prices-page.jsx << 'END'
import { Calculator } from '@/features/calculator';
import { mockDeliveryOptions } from '@/shared/mock/data';
import { Check } from 'lucide-react';
export default function PricesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Услуги доставки из Великобритании</h1>
        <p className="mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
      
      {/* 4 карточки услуг */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 24, marginBottom: 48 }}>
        {[1,2,3,4].map(i => (
          <div key={i} style={{ background: '#fff', padding: 24, borderRadius: 16, border: '1px solid var(--border)' }}>
            <img src={`/images/icons/service${i}.png`} style={{height: 100, marginBottom: 20}} onError={(e)=>e.target.style.display='none'}/>
            <h3 style={{fontSize: 18, marginBottom: 12}}>Услуга {i}</h3>
            <p className="text-muted" style={{fontSize: 14}}>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <Button className="mt-4" variant="outline" style={{width: '100%'}}>Подробнее</Button>
          </div>
        ))}
      </div>

      <h2 className="title-h2 mb-4">Онлайн-калькулятор стоимости доставки товара</h2>
      <p className="text-muted mb-4">Задайте необходимые параметры посылки, и калькулятор рассчитает приблизительную стоимость.</p>
      <Calculator />
      
      <h2 className="title-h2 mt-8 mb-4">Варианты доставки:</h2>
      <div style={{ background: '#fff', borderRadius: 16, border: '1px solid var(--border)', marginBottom: 48 }}>
        {mockDeliveryOptions.map(o => (
          <div key={o.id} style={{ display: 'flex', padding: 24, borderBottom: '1px solid var(--border)', alignItems: 'center' }}>
            <div style={{ flex: 2, display: 'flex', gap: 16, alignItems: 'center' }}><img src={o.img} style={{width:32}} onError={(e)=>e.target.style.display='none'}/><b>{o.name}</b></div>
            <div style={{ flex: 1 }}><span className="text-muted" style={{fontSize:12}}>Сроки:</span><br/><b>{o.days}</b></div>
            <div style={{ flex: 1 }}><span className="text-muted" style={{fontSize:12}}>Стоимость:</span><br/><b>{o.cost}</b></div>
            <div style={{ flex: 1 }}><span className="text-muted" style={{fontSize:12}}>Итого:</span><br/><b>{o.total}</b></div>
            <Check color="var(--primary-green)" />
          </div>
        ))}
      </div>

      <h2 className="title-h2 mt-8 mb-4">Услуги склада</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 0, background: '#fff', borderRadius: 16, border: '1px solid var(--border)', marginBottom: 48 }}>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Консолидация</span><b>£1.00 / шт</b></div>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Заполнение декларации</span><b>£5.00</b></div>
         <div style={{ padding: 24, borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Дополнительная упаковка</span><b>£3.00</b></div>
         <div style={{ padding: 24, display: 'flex', justifyContent: 'space-between' }}><span>Упаковка хрупких предметов</span><b>£10.00</b></div>
      </div>

      {/* Блок оператора */}
      <div className="bg-blue-gradient" style={{ display: 'flex', alignItems: 'center', gap: 40, padding: 40, borderRadius: 24, marginBottom: 48 }}>
        <img src="/images/operator.png" style={{height: 200}} onError={(e)=>e.target.style.display='none'}/>
        <div>
          <h2 style={{color: '#fff', fontSize: 28}}>Попробуйте заказывать с оператором прямо сейчас.</h2>
          <p style={{color: 'rgba(255,255,255,0.8)', marginTop: 12, marginBottom: 24}}>Пришлите ссылку на товар, его купят и доставят на наш склад в кратчайшие сроки.</p>
          <div style={{display: 'flex', gap: 16}}>
            <input type="text" placeholder="Введите ссылку на товар" style={{padding: '12px 16px', borderRadius: 8, border: 'none', width: 300}}/>
            <Button style={{background: 'var(--primary-green)'}}>Отправить</Button>
          </div>
        </div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Страхование</h2>
      <div style={{ background: '#fff', borderRadius: 16, border: '1px solid var(--border)', marginBottom: 48 }}>
        <div style={{ padding: 24, borderBottom: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Дополнительное страхование</span><span className="text-muted">5% от суммы, на которую хотите застраховать</span></div>
        <div style={{ padding: 24, borderBottom: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Почта России и ЕМС</span><span className="text-muted">Застраховано по умолчанию на £50.00</span></div>
        <div style={{ padding: 24, display: 'flex', justifyContent: 'space-between' }}><span>Мелкие пакеты</span><span className="text-muted">Застраховано на £20.00</span></div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Дополнительная упаковка</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 0, background: '#fff', borderRadius: 16, border: '1px solid var(--border)' }}>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Многослойная пленка</span><b>£1.99</b></div>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Упаковка в пакет</span><b>£1.99</b></div>
         <div style={{ padding: 24, borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Упаковка в коробку с двойными стенками</span><b>£4.99</b></div>
         <div style={{ padding: 24, display: 'flex', justifyContent: 'space-between' }}><span>Наклейка "Обращаться с осторожностью"</span><b>£0.25</b></div>
      </div>

    </div>
  );
}
END
echo "export { default as PricesPage } from './ui/prices-page';" > src/pages/prices-page/index.js

# ==========================================
# 7. БОНУСЫ (5 карточек + иконки)
# ==========================================
mkdir -p src/pages/partnership-page/ui
cat > src/pages/partnership-page/ui/partnership-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
export default function PartnershipPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Бонусы и партнерская программа</h1>
        <p className="mt-4">Платим $3 с каждой отправленной посылки</p>
        <Button className="mt-4" style={{ background: 'rgba(255,255,255,0.2)' }}>Начать зарабатывать</Button>
      </div>
      
      <h2 className="title-h2 mb-8">Зарабатывать с нами — проще простого:</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px', marginBottom: '48px' }}>
        {[1,2,3,4,5].map(i => (
          <div key={i} style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)', display: 'flex', gap: '20px' }}>
            <img src={`/images/icons/bonus${i}.png`} style={{width: 40, height: 40}} onError={(e)=>e.target.style.display='none'}/>
            <div>
              <h3 style={{ fontSize: '18px', marginBottom: '12px' }}>Дарим около 10% назад бонусами</h3>
              <p className="text-muted" style={{ fontSize: '14px' }}>Копите бонусы и тратьте их на следующие покупки.</p>
            </div>
          </div>
        ))}
      </div>

      <div className="bg-blue-gradient" style={{ padding: '60px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div style={{display: 'flex', alignItems: 'center', gap: 40}}>
          <img src="/images/bonus-illustration.png" style={{height: 150}} onError={(e)=>e.target.style.display='none'}/>
          <div>
            <h2 style={{ color: '#fff', fontSize: '28px' }}>Готовы начать зарабатывать вместе с нами?</h2>
            <p style={{ color: 'rgba(255,255,255,0.8)', marginTop: '8px' }}>Присоединяйтесь к партнерской программе OkeyPost.com уже сегодня.</p>
            <Button style={{ background: 'var(--primary-green)', marginTop: '24px' }}>Присоединиться</Button>
          </div>
        </div>
      </div>
    </div>
  );
}
END
echo "export { default as PartnershipPage } from './ui/partnership-page';" > src/pages/partnership-page/index.js

# ==========================================
# 8. БЛОГ (12 карточек + низ)
# ==========================================
mkdir -p src/pages/blog-page/ui
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
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2 style={{ color: '#fff', fontSize: '28px' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
      </div>
    </div>
  );
}
END
echo "export { default as BlogPage } from './ui/blog-page';" > src/pages/blog-page/index.js

# ==========================================
# 9. МАГАЗИНЫ (25 карточек по 5 в ряд + низ)
# ==========================================
mkdir -p src/pages/stores-page/ui
cat > src/pages/stores-page/ui/stores-page.jsx << 'END'
import { mockStores } from '@/shared/mock/data';
export default function StoresPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Популярные магазины</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5, 1fr)', gap: '24px' }}>
        {mockStores.map((store, i) => (
          <div key={i} style={{ background: '#fff', height: '120px', borderRadius: '16px', display: 'flex', alignItems: 'center', justifyContent: 'center', border: '1px solid var(--border)' }}><span style={{ fontWeight: 700, color: '#ccc' }}>{store}</span></div>
        ))}
      </div>
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderRadius: '24px' }}><h2 style={{ color: '#fff' }}>Остались вопросы? Спросите нас в соцсетях!</h2></div>
    </div>
  );
}
END
echo "export { default as StoresPage } from './ui/stores-page';" > src/pages/stores-page/index.js

# ==========================================
# 10. FAQ (Больше вопросов)
# ==========================================
mkdir -p src/pages/faq-page/ui
cat > src/pages/faq-page/ui/faq-page.jsx << 'END'
import { useState } from 'react';
import { mockFaq } from '@/shared/mock/data';
import { Search, ChevronDown } from 'lucide-react';
export default function FaqPage() {
  const [open, setOpen] = useState(null);
  return (
    <div className="container page-wrapper" style={{ maxWidth: '900px' }}>
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Отвечаем на вопросы доставки</h1></div>
      <div style={{ display: 'flex', background: '#fff', padding: 16, borderRadius: 12, border: '1px solid var(--border)', marginBottom: 40 }}><input type="text" placeholder="Поиск..." style={{ flex: 1, border: 'none', outline: 'none' }} /> <Search /></div>
      {mockFaq.map((cat, i) => (
        <div key={i} className="mb-8"><h3 className="mb-4">{cat.category}</h3>{cat.items.map(item => (
          <div key={item.id} style={{ background: '#fff', marginBottom: 8, borderRadius: 8, border: '1px solid var(--border)' }}>
            <div onClick={() => setOpen(open === item.id ? null : item.id)} style={{ padding: 20, display: 'flex', justifyContent: 'space-between', cursor: 'pointer' }}>{item.q} <ChevronDown size={20} /></div>
            {open === item.id && <div style={{ padding: '0 20px 20px', color: 'var(--text-muted)' }}>{item.a}</div>}
          </div>
        ))}</div>
      ))}
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}><h2 style={{ color: '#fff' }}>Остались вопросы?</h2></div>
    </div>
  );
}
END
echo "export { default as FaqPage } from './ui/faq-page';" > src/pages/faq-page/index.js

echo "✅ ВСЁ ГОТОВО! Все блоки добавлены, футер починен, карточки расширены."
