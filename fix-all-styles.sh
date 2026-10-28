#!/bin/bash
echo "🎨 Выносим CSS в отдельные файлы и наполняем контентом..."

# ==========================================
# 1. ОБЩИЕ СТИЛИ (Обновляем)
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
.container { max-width: 1440px; margin: 0 auto; padding: 0 40px; }
.page-wrapper { padding-top: 40px; padding-bottom: 80px; min-height: 70vh; }
.title-h1 { font-size: 40px; font-weight: 700; line-height: 1.2; margin-bottom: 24px; }
.title-h2 { font-size: 32px; font-weight: 700; line-height: 1.2; margin-bottom: 24px; }
.text-muted { color: var(--text-muted); font-size: 15px; }
.bg-blue-gradient { background: linear-gradient(90deg, #5B52A3, #40B8EA); color: #fff; border-radius: 24px; }
.mb-4 { margin-bottom: 16px; } .mb-8 { margin-bottom: 32px; } .mt-4 { margin-top: 16px; } .mt-8 { margin-top: 32px; }
END

# ==========================================
# 2. МОК-ДАННЫЕ (Расширяем FAQ и Магазины)
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
];
// 25 магазинов с путями к иконкам
export const mockStores = Array.from({ length: 25 }).map((_, i) => ({ id: i + 1, name: `Store ${i + 1}`, img: `/images/stores/store${i + 1}.png` }));

export const mockSales = [
  { id: 1, shop: 'Abercrombie & Fitch', desc: 'Скидки до 50%', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/1.png' },
  { id: 2, shop: 'Polo Ralph Lauren', desc: 'Скидки до 40%', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/2.png' },
  { id: 3, shop: 'Michael Kors', desc: 'Black Friday Early Access', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/3.png' },
  { id: 4, shop: "Victoria's Secret", desc: 'Скидки на комплекты', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/4.png' },
  { id: 5, shop: 'Timberland', desc: 'Новая коллекция', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/5.png' },
  { id: 6, shop: 'Hollister Co.', desc: 'Скидки до 50%', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/6.png' },
  { id: 7, shop: 'Levi\'s', desc: 'Скидки 30% на джинсы', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/7.png' },
  { id: 8, shop: 'UGG', desc: 'Вход с VPN', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/8.png' },
  { id: 9, shop: 'New Balance', desc: 'Скидки 50%', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/9.png' },
  { id: 10, shop: 'Ayrner Saks OFF 5TH', desc: 'Black Friday', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/10.png' },
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
  { category: 'Виртуальный адрес в Великобритании', items: [
    { id: 1, q: 'Что делать, если вы забыли внести трек-номер?', a: 'Свяжитесь с поддержкой.' }, 
    { id: 2, q: 'Как я узнаю, что заказ пришел на склад?', a: 'Вам придет SMS.' }, 
    { id: 3, q: 'Сколько стоит виртуальный адрес?', a: 'Бесплатно.' },
    { id: 4, q: 'Можно ли купить с частной предпринимателя?', a: 'Да, можно.' },
    { id: 5, q: 'Что такое обычный заказ?', a: 'Это стандартная процедура.' }
  ]},
  { category: 'Покупки в магазинах Англии, скидки и промокода', items: [
    { id: 6, q: 'Анонс скидочных купонов и промокодов', a: 'В нашем блоге.' }, 
    { id: 7, q: 'Как узнать пришел ли заказ полностью?', a: 'В личном кабинете.' },
    { id: 8, q: 'Купил на Ebay, продавец не отправляет заказ, нужен скан返.', a: 'Обратитесь в поддержку.' },
    { id: 9, q: 'Сколько стоит удаление вешалок и коробок?', a: 'Бесплатно.' },
    { id: 10, q: 'Какой срок бесплатного хранения?', a: '70 дней.' }
  ]},
  { category: 'Доставка из Англии', items: [
    { id: 11, q: 'Как часто вы отправляете посылки?', a: 'Еженедельно.' },
    { id: 12, q: 'Возможно ли доставка в страны, не указанные на сайте?', a: 'Да, напишите в поддержку.' },
    { id: 13, q: 'Сколько стоит доставка в Казахстан и другие страны Азии?', a: 'Рассчитывается индивидуально.' },
  ]},
];
END

# ==========================================
# 3. ГЛАВНАЯ (Раздельный CSS, больше текста, место под иконки)
# ==========================================
mkdir -p src/pages/home-page/ui
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { Calculator } from '@/features/calculator';
import { mockCategories, mockDeliveryOptions, mockReviews } from '@/shared/mock/data';
import { Star } from 'lucide-react';
import './home-page.css';

export default function HomePage() {
  return (
    <div className="home-wrapper">
      <div className="container mt-8">
        <div className="home-hero bg-blue-gradient">
          <div className="hero-text">
            <h1>Доставка товаров из Великобритании в Россию</h1>
            <p>Начните экономить до 80% на шоппинге. Регистрируйтесь в OkeyPost, чтобы получить адрес в UK склада. Мы поможем вам с покупками, консолидацией и доставкой до вашей двери.</p>
            <Button className="mt-8" onClick={() => alert('Функционал в разработке')}>Получить адрес в UK</Button>
          </div>
          <img src="/images/hero.png" alt="Hero" className="hero-img" onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
      
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">Насколько выгодно покупать?</h2>
        <div className="categories-bar">
          {mockCategories.map(c=><div key={c.id} className="category-item"><img src={c.img} className="cat-icon" onError={(e)=>e.target.style.display='none'}/><span>{c.name}</span></div>)}
        </div>
      </div>
      
      <div className="container mt-8">
        <div className="jacket-block">
          <div className="jacket-side">
            <h3>Columbia Barlow Pass 550 Turbodown Jacket</h3>
            <div className="price-tag"><img src="/images/icons/flag-ru.png" className="flag" onError={(e)=>e.target.style.display='none'}/><div><p className="text-muted" style={{fontSize:12}}>Цена в России</p><b>7891,46₽</b></div></div>
          </div>
          <div className="jacket-center">
            <img src="/images/jacket.png" className="jacket-img" onError={(e)=>e.target.style.display='none'}/>
          </div>
          <div className="jacket-side text-right">
            <h3>Доставка одежды из Великобритании <span style={{color:'var(--primary-green)'}}>от £7.79</span></h3>
            <div className="price-tag right"><div><p className="text-muted" style={{fontSize:12}}>Цена в UK</p><b>£80.62</b></div><img src="/images/icons/flag-uk.png" className="flag" onError={(e)=>e.target.style.display='none'}/></div>
          </div>
        </div>
        <div className="jacket-bottom">
          <img src="/images/icons/tshirt.png" className="extra-icon" onError={(e)=>e.target.style.display='none'}/>
          <p className="text-muted">Срок доставки примерно 10 дней<br/><b style={{color: '#1A1A1A', fontSize: 18}}>Вы экономите до <span style={{color: 'var(--primary-green)'}}>$119.56</span></b></p>
          <img src="/images/icons/jeans.png" className="extra-icon" onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>

      <div className="container mt-8">
        <div className="masters-block bg-blue-gradient">
          <img src="/images/master.png" className="masters-img" onError={(e)=>e.target.style.display='none'}/>
          <div className="masters-text">
            <h2>Поручите нашим мастерам оформление заказов в английских магазинах</h2>
            <p>Такой способ покупки также подойдет, если магазин принимает только английские карты.</p>
            <Button className="mt-4" onClick={() => alert('Функционал в разработке')}>Попробовать</Button>
          </div>
        </div>
      </div>

      <div className="container mt-8">
        <h2 className="title-h2">OkeyPost удобная и быстрая доставка посылок</h2>
        <Calculator />
      </div>
      
      <div className="container mt-8">
        <h3 className="title-h2 mb-4" style={{fontSize:24}}>Варианты доставки:</h3>
        <div className="delivery-list">
          {mockDeliveryOptions.map(o=><div key={o.id} className="delivery-row"><div className="del-name"><img src={o.img} className="del-icon" onError={(e)=>e.target.style.display='none'}/><b>{o.name}</b></div><div className="del-info">Сроки: {o.days}</div><div className="del-info">Стоимость: {o.cost}</div><div className="del-info">Итого: {o.total}</div></div>)}
        </div>
      </div>

      <div className="container mt-8">
        <h2 className="title-h2 mb-8">4 простых шага для ваших покупок в Великобритании</h2>
        <div className="steps-grid">
          {[1, 2, 3, 4].map(i => (
             <div key={i} className="step-block">
               <img src={`/images/steps/step${i}.png`} className="step-img" onError={(e)=>e.target.style.display='none'}/>
               <h4>Шаг {i}</h4>
               <p className="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
             </div>
          ))}
        </div>
      </div>

      <div className="container mt-8">
        <div className="tour-block bg-blue-gradient">
          <img src="/images/virtual-tour.png" className="tour-img" onError={(e)=>e.target.style.display='none'}/>
          <div><h2>Виртуальный тур по нашему складу</h2><p className="mt-4">Вы можете всегда посмотреть на нашу слаженную работу.</p><Button className="mt-4" onClick={() => alert('Функционал в разработке')}>Попробовать</Button></div>
        </div>
      </div>

      <div className="container mt-8">
        <h2 className="title-h2">120 000 довольных клиентов в России</h2>
        <div className="reviews-grid">
          {mockReviews.map(r=><div key={r.id} className="review-card"><img src={r.img} className="review-img" onError={(e)=>e.target.style.background='#eee'}/><div><h4>{r.name}</h4><div className="stars">{[...Array(r.stars)].map((_, i) => <Star key={i} size={14} fill="#FFB800" />)}</div><p className="text-muted mt-4">{r.text}</p><span className="review-date">Дата: {r.date} <br/> Город: {r.city}</span></div></div>)}
        </div>
      </div>

      <div className="container mt-8 text-block">
        <h2 className="title-h2 mb-4">Ваш личный адрес в Великобритании для покупок</h2>
        <p className="text-muted">С нами вы получаете целых два адреса в UK! У нас есть два склада для приема посылок – в Лондоне и Манчестере. Указывайте в магазине тот из них, отправка на который обойдется дешевле.</p>
        <p className="text-muted mt-4">При доставке из UK в Россию все ваши товары обязательно страхуются. Прием посылок на наш склад, их обработка, удаление лишних коробок, хранение сроком до 70 дней – у нас полностью бесплатно.</p>
      </div>

      <div className="container mt-8">
        <div className="subscribe-block bg-blue-gradient">
          <h2>Подпишитесь и будьте в курсе всех скидок и акций магазинов Великобритании!</h2>
          <div className="sub-form">
            <input type="text" placeholder="Введите ваш email"/>
            <Button onClick={() => alert('Подписка оформлена!')}>Подписаться</Button>
          </div>
        </div>
      </div>
    </div>
  );
}
END

cat > src/pages/home-page/ui/home-page.css << 'END'
.home-hero { display: flex; justify-content: space-between; align-items: center; padding: 80px; border-radius: 36px; }
.hero-text h1 { font-size: 56px; max-width: 600px; line-height: 1.1; color: #fff; margin-bottom: 24px;}
.hero-text p { font-size: 18px; max-width: 500px; color: rgba(255,255,255,0.9); line-height: 1.5;}
.hero-img { height: 400px; object-fit: contain; }

.categories-bar { display: flex; justify-content: space-between; background: #fff; padding: 32px; border-radius: 24px; border: 1px solid var(--border); }
.category-item { display: flex; flex-direction: column; align-items: center; gap: 16px; cursor: pointer; transition: 0.2s;}
.category-item:hover { transform: translateY(-5px); }
.cat-icon { width: 48px; height: 48px; object-fit: contain; }

.jacket-block { display: flex; justify-content: space-between; align-items: center; background: #fff; padding: 60px; border-radius: 36px; border: 1px solid var(--border); }
.jacket-side { flex: 1; }
.jacket-center { flex: 1; display: flex; justify-content: center; }
.jacket-img { max-width: 100%; height: 350px; object-fit: contain; }
.price-tag { display: flex; gap: 16px; background: #F5F7FA; padding: 16px; border-radius: 16px; align-items: center; width: fit-content; }
.price-tag.right { margin-left: auto; justify-content: flex-end;}
.flag { width: 32px; }
.jacket-bottom { display: flex; justify-content: space-between; padding: 24px 80px; align-items: center;}
.extra-icon { height: 80px; }

.masters-block { display: flex; align-items: center; padding: 60px; gap: 60px; }
.masters-img { height: 250px; }
.masters-text h2 { color: #fff; font-size: 32px; margin-bottom: 16px;}
.masters-text p { color: rgba(255,255,255,0.9); font-size: 16px;}

.delivery-list { background: #fff; border-radius: 16px; border: 1px solid var(--border); }
.delivery-row { display: flex; padding: 24px; border-bottom: 1px solid var(--border); align-items: center; }
.delivery-row:last-child { border-bottom: none; }
.del-name { flex: 2; display: flex; gap: 16px; align-items: center; }
.del-icon { width: 32px; }
.del-info { flex: 1; font-size: 15px; }

.steps-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 32px; }
.step-block h4 { font-size: 16px; text-transform: uppercase; margin: 24px 0 12px; font-weight: 700; }
.step-img { height: 180px; object-fit: contain; display: block; margin: 0 auto; }

.tour-block { display: flex; align-items: center; padding: 60px; gap: 60px; }
.tour-img { height: 200px; }
.tour-block h2 { color: #fff; }

.reviews-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; margin-top: 24px;}
.review-card { background: #fff; padding: 32px; border-radius: 16px; display: flex; gap: 24px; border: 1px solid var(--border); }
.review-img { width: 120px; height: 120px; border-radius: 12px; object-fit: cover; }
.stars { color: #FFB800; display: flex; gap: 4px; margin-top: 4px;}
.review-date { font-size: 13px; color: #999; margin-top: 16px; display: block; line-height: 1.5; }

.text-block { max-width: 900px; }
.text-block p { line-height: 1.8; margin-bottom: 16px; }

.subscribe-block { display: flex; justify-content: space-between; align-items: center; padding: 60px; }
.subscribe-block h2 { color: #fff; max-width: 600px; font-size: 32px; }
.sub-form { display: flex; gap: 16px; }
.sub-form input { padding: 16px 24px; border-radius: 8px; border: none; width: 300px; font-size: 16px;}

@media (max-width: 1024px) {
  .home-hero, .jacket-block, .masters-block, .tour-block, .subscribe-block { flex-direction: column; text-align: center; padding: 40px; }
  .jacket-side.text-right { text-align: center; }
  .price-tag.right { margin: 0 auto; }
  .categories-bar { flex-wrap: wrap; justify-content: center; gap: 30px; }
  .steps-grid, .reviews-grid { grid-template-columns: 1fr; }
  .delivery-row { flex-direction: column; align-items: flex-start; gap: 16px; }
}
END
echo "export { default as HomePage } from './ui/home-page';" > src/pages/home-page/index.js

# ==========================================
# 4. КАК ПОКУПАТЬ (Иконки рядом с цифрами)
# ==========================================
mkdir -p src/pages/how-to-buy-page/ui
cat > src/pages/how-to-buy-page/ui/how-to-buy-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import './how-to-buy-page.css';

export default function HowToBuyPage() {
  const steps = [
    { id: 1, title: 'ПОЛУЧАЕТЕ АДРЕС ДЛЯ ПОКУПОК', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step1.png' },
    { id: 2, title: 'ИДЕТЕ ЗА ПОКУПКАМИ', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step2.png' },
    { id: 3, title: 'СЛЕДИТЕ ЗА ПЕРЕМЕЩЕНИЕМ', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step3.png' },
    { id: 4, title: 'ОПЛАЧИВАЕТЕ ДОСТАВКУ', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step4.png' },
    { id: 5, title: 'ПОЛУЧАЕТЕ ПОСЫЛКУ', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step5.png' },
  ];

  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Научим покупать в Великобритании!</h1>
        <p className="mt-4" style={{color: 'rgba(255,255,255,0.8)'}}>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        <Button className="mt-4" onClick={() => alert('Функционал в разработке')}>Получить адрес в UK</Button>
      </div>
      
      <h2 className="title-h2 mb-8">Покупать в Великобритании очень просто</h2>
      <div className="how-to-grid">
        <div>
          <p className="text-muted mb-8">Английские магазины не доставляют в Россию, но это не проблема. С OkeyPost можно покупать по лучшим ценам и экономить до 70%.</p>
          <div className="steps-column">
            {steps.map(step => (
              <div key={step.id} className="how-step">
                <div className="step-num-block">
                  <span>0{step.id}</span>
                  <img src={step.img} className="step-thumb" onError={(e)=>e.target.style.display='none'}/>
                </div>
                <div><h4>{step.title}</h4><p className="text-muted">{step.desc}</p></div>
              </div>
            ))}
          </div>
        </div>
        <div className="sticky-illustration">
           <img src="/images/how-to-buy-illustration.png" style={{ width: '100%' }} onError={(e)=>e.target.style.display='none'} />
        </div>
      </div>

      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2 style={{ color: '#fff', fontSize: '28px' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
        <div style={{display:'flex', gap: 16}}>
          <img src="/images/icons/whatsapp.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
          <img src="/images/icons/telegram.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
          <img src="/images/icons/viber.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
    </div>
  );
}
END
cat > src/pages/how-to-buy-page/ui/how-to-buy-page.css << 'END'
.how-to-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 60px; }
.steps-column { display: flex; flex-direction: column; gap: 40px; }
.how-step { display: flex; gap: 24px; }
.step-num-block { display: flex; flex-direction: column; align-items: center; gap: 12px;}
.step-num-block span { color: var(--primary-green); font-size: 36px; font-weight: 700; opacity: 0.5; }
.step-thumb { width: 60px; height: 60px; object-fit: contain; }
.how-step h4 { font-size: 16px; font-weight: 700; margin-bottom: 8px; margin-top: 12px;}
.how-step p { font-size: 14px; line-height: 1.6;}
.sticky-illustration { position: sticky; top: 100px; }
@media(max-width: 992px) { .how-to-grid { grid-template-columns: 1fr; } .sticky-illustration { display: none; } }
END
echo "export { default as HowToBuyPage } from './ui/how-to-buy-page';" > src/pages/how-to-buy-page/index.js

# ==========================================
# 5. РАСПРОДАЖИ (Добавляем текст)
# ==========================================
mkdir -p src/pages/sales-page/ui
cat > src/pages/sales-page/ui/sales-page.jsx << 'END'
import { mockSales } from '@/shared/mock/data';
import { Button } from '@/shared/ui/button';
import './sales-page.css';

export default function SalesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Распродажи</h1>
        <p className="mt-4" style={{color: 'rgba(255,255,255,0.8)'}}>Ранний доступ к распродажам в магазинах</p>
        <Button className="mt-4" onClick={() => alert('Получение адреса')}>Получить адрес в UK</Button>
      </div>
      
      <h2 className="title-h2 mb-8">Black Friday Early Access<br/>ранний доступ к распродажам в магазинах Великобритании!</h2>
      
      <div className="sales-grid">
        {mockSales.map(item => (
          <div key={item.id} className="sale-card">
            <img src={item.img} className="sale-img" onError={(e) => e.target.style.background='#ddd'} />
            <div className="sale-info">
              <h3>{item.shop}</h3>
              <p className="text-muted mt-4">{item.desc}</p>
              <p className="text-muted mt-4" style={{fontSize: 12}}>{item.info}</p>
              <a href="#" className="sale-link">Товары в магазине →</a>
            </div>
          </div>
        ))}
      </div>

      <div className="bg-blue-gradient mt-8 cta-bottom">
        <h2>Остались вопросы? Спросите нас в соцсетях!</h2>
        <div style={{display:'flex', gap: 16}}>
          <img src="/images/icons/whatsapp.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
          <img src="/images/icons/telegram.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
    </div>
  );
}
END
cat > src/pages/sales-page/ui/sales-page.css << 'END'
.sales-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 32px; }
.sale-card { background: #fff; padding: 24px; border-radius: 16px; display: flex; gap: 24px; border: 1px solid var(--border); }
.sale-img { width: 180px; height: 180px; object-fit: cover; border-radius: 12px; background: #eee; }
.sale-info h3 { font-size: 20px; margin-bottom: 12px; }
.sale-link { display: inline-block; margin-top: 16px; color: var(--primary-blue); font-size: 14px; font-weight: 500; }
.cta-bottom { padding: 40px; border-radius: 24px; display: flex; justify-content: space-between; align-items: center; }
@media(max-width: 992px) { .sales-grid { grid-template-columns: 1fr; } .sale-card { flex-direction: column; } .sale-img { width: 100%; height: 200px; } .cta-bottom { flex-direction: column; gap: 24px; text-align: center; } }
END
echo "export { default as SalesPage } from './ui/sales-page';" > src/pages/sales-page/index.js

# ==========================================
# 6. ЦЕНЫ (Исправлен импорт Button)
# ==========================================
mkdir -p src/pages/prices-page/ui
cat > src/pages/prices-page/ui/prices-page.jsx << 'END'
import { Calculator } from '@/features/calculator';
import { mockDeliveryOptions } from '@/shared/mock/data';
import { Check } from 'lucide-react';
import { Button } from '@/shared/ui/button'; // ИСПРАВЛЕНО!
import './prices-page.css';

export default function PricesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Услуги доставки из Великобритании</h1>
        <p className="mt-4" style={{color: 'rgba(255,255,255,0.8)'}}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor.</p>
      </div>
      
      <div className="services-grid">
        {[1,2,3,4].map(i => (
          <div key={i} className="service-card">
            <img src={`/images/icons/service${i}.png`} className="service-icon" onError={(e)=>e.target.style.display='none'}/>
            <h3>Услуга {i}</h3>
            <p className="text-muted mt-4" style={{fontSize: 14}}>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <Button className="mt-4" variant="outline" style={{width: '100%'}}>Подробнее</Button>
          </div>
        ))}
      </div>

      <h2 className="title-h2 mb-4">Онлайн-калькулятор стоимости доставки товара</h2>
      <p className="text-muted mb-4">Задайте необходимые параметры посылки, и калькулятор рассчитает приблизительную стоимость.</p>
      <Calculator />
      
      <h2 className="title-h2 mt-8 mb-4">Варианты доставки:</h2>
      <div className="table-container">
        {mockDeliveryOptions.map(o => (
          <div key={o.id} className="table-row">
            <div className="col-name"><img src={o.img} style={{width:32}} onError={(e)=>e.target.style.display='none'}/><b>{o.name}</b></div>
            <div className="col-info"><span className="text-muted">Сроки:</span><br/><b>{o.days}</b></div>
            <div className="col-info"><span className="text-muted">Стоимость:</span><br/><b>{o.cost}</b></div>
            <div className="col-info"><span className="text-muted">Итого:</span><br/><b>{o.total}</b></div>
            <Check color="var(--primary-green)" />
          </div>
        ))}
      </div>

      <h2 className="title-h2 mt-8 mb-4">Услуги склада</h2>
      <div className="grid-2">
         <div className="grid-cell"><span>Консолидация</span><b>£1.00 / шт</b></div>
         <div className="grid-cell"><span>Заполнение декларации</span><b>£5.00</b></div>
         <div className="grid-cell"><span>Дополнительная упаковка</span><b>£3.00</b></div>
         <div className="grid-cell"><span>Упаковка хрупких предметов</span><b>£10.00</b></div>
      </div>

      <div className="operator-block bg-blue-gradient">
        <img src="/images/operator.png" style={{height: 200}} onError={(e)=>e.target.style.display='none'}/>
        <div>
          <h2>Попробуйте заказывать с оператором прямо сейчас.</h2>
          <p className="mt-4">Пришлите ссылку на товар, его купят и доставят на наш склад в кратчайшие сроки.</p>
          <div className="operator-form">
            <input type="text" placeholder="Введите ссылку на товар" />
            <Button onClick={() => alert('Отправлено!')}>Отправить</Button>
          </div>
        </div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Страхование</h2>
      <div className="table-container">
        <div className="row-2-col"><span>Дополнительное страхование</span><span className="text-muted">5% от суммы</span></div>
        <div className="row-2-col"><span>Почта России и ЕМС</span><span className="text-muted">Застраховано на £50.00</span></div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Дополнительная упаковка</h2>
      <div className="grid-2">
         <div className="grid-cell"><span>Многослойная пленка</span><b>£1.99</b></div>
         <div className="grid-cell"><span>Упаковка в пакет</span><b>£1.99</b></div>
         <div className="grid-cell"><span>Коробка с двойными стенками</span><b>£4.99</b></div>
         <div className="grid-cell"><span>Наклейка "Осторожно"</span><b>£0.25</b></div>
      </div>
    </div>
  );
}
END
cat > src/pages/prices-page/ui/prices-page.css << 'END'
.services-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; margin-bottom: 48px; }
.service-card { background: #fff; padding: 24px; border-radius: 16px; border: 1px solid var(--border); display: flex; flex-direction: column; }
.service-icon { height: 100px; object-fit: contain; margin-bottom: 20px; }
.table-container { background: #fff; border-radius: 16px; border: 1px solid var(--border); overflow: hidden; margin-bottom: 48px;}
.table-row { display: flex; padding: 24px; border-bottom: 1px solid var(--border); align-items: center; }
.table-row:last-child { border-bottom: none; }
.col-name { flex: 2; display: flex; gap: 16px; align-items: center; }
.col-info { flex: 1; font-size: 14px; }
.grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 0; background: #fff; border-radius: 16px; border: 1px solid var(--border); margin-bottom: 48px;}
.grid-cell { padding: 24px; border-bottom: 1px solid var(--border); border-right: 1px solid var(--border); display: flex; justify-content: space-between; }
.grid-cell:nth-child(even) { border-right: none; }
.grid-cell:nth-last-child(-n+2) { border-bottom: none; }
.operator-block { display: flex; align-items: center; gap: 40px; padding: 40px; margin-bottom: 48px;}
.operator-block h2 { color: #fff; font-size: 28px; }
.operator-block p { color: rgba(255,255,255,0.8); }
.operator-form { display: flex; gap: 16px; margin-top: 24px;}
.operator-form input { padding: 12px 16px; border-radius: 8px; border: none; width: 300px; }
.row-2-col { display: flex; justify-content: space-between; padding: 24px; border-bottom: 1px solid var(--border); }
.row-2-col:last-child { border-bottom: none; }
@media(max-width: 992px) { .services-grid { grid-template-columns: 1fr 1fr; } .table-row { flex-direction: column; align-items: flex-start; gap: 12px; } .grid-2 { grid-template-columns: 1fr; } .grid-cell { border-right: none; } .operator-block { flex-direction: column; } }
END
echo "export { default as PricesPage } from './ui/prices-page';" > src/pages/prices-page/index.js

# ==========================================
# 7. БОНУСЫ (Починена кнопка, раздельный CSS)
# ==========================================
mkdir -p src/pages/partnership-page/ui
cat > src/pages/partnership-page/ui/partnership-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import './partnership-page.css';

export default function PartnershipPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Бонусы и партнерская программа</h1>
        <p className="mt-4">Платим $3 с каждой отправленной посылки</p>
        <Button className="mt-4" onClick={() => alert('Функционал в разработке')}>Начать зарабатывать</Button>
      </div>
      
      <h2 className="title-h2 mb-8">Зарабатывать с нами — проще простого:</h2>
      <div className="bonus-grid">
        {[1,2,3,4,5].map(i => (
          <div key={i} className="bonus-card">
            <img src={`/images/icons/bonus${i}.png`} className="bonus-icon" onError={(e)=>e.target.style.display='none'}/>
            <div>
              <h3>Дарим около 10% назад бонусами</h3>
              <p className="text-muted mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
            </div>
          </div>
        ))}
      </div>

      <div className="bg-blue-gradient cta-banner">
        <img src="/images/bonus-illustration.png" className="cta-img" onError={(e)=>e.target.style.display='none'}/>
        <div>
          <h2>Готовы начать зарабатывать вместе с нами?</h2>
          <p className="mt-4">Присоединяйтесь к партнерской программе OkeyPost.com уже сегодня.</p>
          <Button className="mt-8" onClick={() => alert('Регистрация партнера')}>Присоединиться</Button>
        </div>
      </div>
    </div>
  );
}
END
cat > src/pages/partnership-page/ui/partnership-page.css << 'END'
.bonus-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; margin-bottom: 48px; }
.bonus-card { background: #fff; padding: 32px; border-radius: 16px; border: 1px solid var(--border); display: flex; gap: 20px; }
.bonus-icon { width: 48px; height: 48px; object-fit: contain; }
.bonus-card h3 { font-size: 18px; margin-bottom: 12px; }
.cta-banner { padding: 60px; border-radius: 24px; display: flex; align-items: center; gap: 60px; }
.cta-banner h2 { color: #fff; font-size: 32px; }
.cta-banner p { color: rgba(255,255,255,0.8); }
.cta-img { height: 200px; }
@media(max-width: 992px) { .bonus-grid { grid-template-columns: 1fr; } .cta-banner { flex-direction: column; text-align: center;} }
END
echo "export { default as PartnershipPage } from './ui/partnership-page';" > src/pages/partnership-page/index.js

# ==========================================
# 8. МАГАЗИНЫ (Место под 25 иконок)
# ==========================================
mkdir -p src/pages/stores-page/ui
cat > src/pages/stores-page/ui/stores-page.jsx << 'END'
import { mockStores } from '@/shared/mock/data';
import './stores-page.css';

export default function StoresPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Популярные магазины</h1></div>
      
      <div className="stores-grid">
        {mockStores.map((store, i) => (
          <div key={i} className="store-card">
            <img src={store.img} className="store-logo" onError={(e) => {e.target.style.display='none'; e.target.nextSibling.style.display='block'}}/>
            <span className="store-fallback" style={{display: 'none'}}>{store.name}</span>
          </div>
        ))}
      </div>

      <div className="bg-blue-gradient mt-8 cta-bottom">
        <h2>Остались вопросы? Спросите нас в соцсетях!</h2>
        <div style={{display:'flex', gap: 16}}>
          <img src="/images/icons/whatsapp.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
          <img src="/images/icons/telegram.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
    </div>
  );
}
END
cat > src/pages/stores-page/ui/stores-page.css << 'END'
.stores-grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 24px; }
.store-card { background: #fff; height: 120px; border-radius: 16px; display: flex; align-items: center; justify-content: center; border: 1px solid var(--border); transition: 0.2s; cursor: pointer; }
.store-card:hover { border-color: var(--primary-blue); box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
.store-logo { max-width: 80%; max-height: 60px; object-fit: contain; }
.store-fallback { font-weight: 700; color: #ccc; }
.cta-bottom { padding: 40px; border-radius: 24px; display: flex; justify-content: space-between; align-items: center; }
@media(max-width: 1024px) { .stores-grid { grid-template-columns: repeat(3, 1fr); } .cta-bottom { flex-direction: column; gap: 24px; text-align: center; } }
@media(max-width: 768px) { .stores-grid { grid-template-columns: repeat(2, 1fr); } }
END
echo "export { default as StoresPage } from './ui/stores-page';" > src/pages/stores-page/index.js

# ==========================================
# 9. FAQ (Больше вопросов)
# ==========================================
mkdir -p src/pages/faq-page/ui
cat > src/pages/faq-page/ui/faq-page.jsx << 'END'
import { useState } from 'react';
import { mockFaq } from '@/shared/mock/data';
import { Search, ChevronDown } from 'lucide-react';
import './faq-page.css';

export default function FaqPage() {
  const [open, setOpen] = useState(null);
  return (
    <div className="container page-wrapper faq-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Отвечаем на вопросы доставки</h1></div>
      
      <div className="faq-search">
        <input type="text" placeholder="Поиск по вопросам и ответам..." />
        <Search size={24} color="var(--primary-blue)"/>
      </div>
      
      {mockFaq.map((cat, i) => (
        <div key={i} className="faq-category">
          <h3>{cat.category}</h3>
          {cat.items.map(item => (
            <div key={item.id} className="faq-item">
              <div onClick={() => setOpen(open === item.id ? null : item.id)} className="faq-q">
                {item.q} <ChevronDown size={20} className={open === item.id ? 'rotate' : ''}/>
              </div>
              {open === item.id && <div className="faq-a">{item.a}</div>}
            </div>
          ))}
        </div>
      ))}

      <div className="bg-blue-gradient mt-8 cta-bottom">
        <h2>Остались вопросы? Спросите нас в соцсетях!</h2>
        <div style={{display:'flex', gap: 16}}>
          <img src="/images/icons/whatsapp.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
          <img src="/images/icons/telegram.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
    </div>
  );
}
END
cat > src/pages/faq-page/ui/faq-page.css << 'END'
.faq-wrapper { max-width: 900px; }
.faq-search { display: flex; background: #fff; padding: 16px 24px; border-radius: 12px; border: 1px solid var(--border); margin-bottom: 40px; align-items: center;}
.faq-search input { flex: 1; border: none; outline: none; font-size: 16px; }
.faq-category { margin-bottom: 40px; }
.faq-category h3 { font-size: 24px; margin-bottom: 20px; }
.faq-item { background: #fff; margin-bottom: 8px; border-radius: 8px; border: 1px solid var(--border); }
.faq-q { padding: 20px 24px; display: flex; justify-content: space-between; cursor: pointer; font-weight: 500; font-size: 16px; align-items: center;}
.faq-q svg { transition: 0.3s; }
.faq-q svg.rotate { transform: rotate(180deg); }
.faq-a { padding: 0 24px 24px; color: var(--text-muted); line-height: 1.6; }
.cta-bottom { padding: 40px; border-radius: 24px; display: flex; justify-content: space-between; align-items: center; }
@media(max-width: 768px) { .cta-bottom { flex-direction: column; gap: 24px; text-align: center; } }
END
echo "export { default as FaqPage } from './ui/faq-page';" > src/pages/faq-page/index.js

echo "✅ ВСЁ ГОТОВО! Ошибки исправлены, CSS вынесен, контент добавлен."
