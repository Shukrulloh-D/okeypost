#!/bin/bash
echo "🔥 СБОРКА ВСЕГО ПРОЕКТА OkeyPost (Стили, логика, все страницы)..."

# 1. Обновляем стили (Широкий контейнер, отступы)
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
.text-center { text-align: center; }
.mt-4 { margin-top: 16px; } .mt-8 { margin-top: 32px; } .mb-4 { margin-bottom: 16px; } .mb-8 { margin-bottom: 32px; }
.title-h1 { font-size: 48px; font-weight: 700; line-height: 1.2; margin-bottom: 24px;}
.title-h2 { font-size: 36px; font-weight: 700; line-height: 1.2; margin-bottom: 24px; }
.text-muted { color: var(--text-muted); font-size: 16px; }
.page-wrapper { padding-top: 60px; padding-bottom: 100px; min-height: 70vh; }
END

# 2. Данные (Data)
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
  { id: 3, name: 'VLADIMIR E', stars: 5, text: 'Отзыв, как всегда! Отдельное спасибо за упаковку.', date: '16 Ноября 2021', city: 'Санкт-Петербург', img: '/images/reviews/3.png' },
  { id: 4, name: 'Оксана', stars: 5, text: 'Очень быстро, надежно! Как всегда большое спасибо за работу!', date: '16 Ноября 2021', city: 'Odintsovo', img: '/images/reviews/4.png' },
];
export const mockStores = [
  { id: 1, name: 'PRIMARK', logo: '/images/stores/primark.png' },
  { id: 2, name: 'H&M', logo: '/images/stores/hm.png' },
  { id: 3, name: 'MANGO', logo: '/images/stores/mango.png' },
  { id: 4, name: 'ZARA', logo: '/images/stores/zara.png' },
  { id: 5, name: 'ASOS', logo: '/images/stores/asos.png' },
  { id: 6, name: 'eBay', logo: '/images/stores/ebay.png' },
];
export const mockOrders = [
  { id: '501', date: '15.10.2022', track: 'UK123456789', sum: '12 450 ₽', status: 'В пути' },
  { id: '502', date: '18.10.2022', track: 'UK987654321', sum: '5 200 ₽', status: 'На складе' },
];
export const mockFaqData = [
  { category: 'Виртуальный адрес', items: [
    { id: 1, q: 'Как я узнаю, что заказ пришел на склад?', a: 'Вам придет SMS-уведомление.' },
    { id: 2, q: 'Сколько стоит виртуальный адрес?', a: 'Бесплатно при регистрации.' },
  ]},
  { category: 'Доставка', items: [
    { id: 3, q: 'Как часто вы отправляете посылки?', a: 'Еженедельно, по мере комплектации.' },
  ]}
];
END

# 3. Обновляем Header и Footer
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
        <Link to="/" className="logo">
          <img src="/images/logo.png" alt="OkeyPost" style={{height: 36}} onError={(e) => {e.target.style.display='none'; e.target.nextSibling.style.display='block'}} />
          <span style={{display: 'none', fontSize: '24px', fontWeight: 800, color: 'var(--primary-blue)'}}>OkeyPost</span>
        </Link>
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
          {isAuth ? (
            <Link to="/profile" className="icon-btn"><User size={20} /> Профиль</Link>
          ) : (
            <Link to="/login" className="icon-btn"><User size={20} /> Вход</Link>
          )}
          <Link to={isAuth ? "/create-parcel" : "/login"}>
            <Button className="desktop-btn">Создать посылку</Button>
          </Link>
        </div>
      </div>
    </header>
  );
}
END

# 4. ГЛАВНАЯ СТРАНИЦА (ПОЛНОСТЬЮ ПО FIGMA)
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { DeliveryCalculator } from '@/features/delivery-calculator';
import { mockCategories, mockDeliveryOptions, mockReviews } from '@/shared/mock/data';
import { Star } from 'lucide-react';
import './home-page.css';

export default function HomePage() {
  return (
    <div>
      {/* HERO */}
      <div className="container mt-8">
        <div className="hero-banner">
          <div className="hero-text">
            <h1>Доставка товаров из Великобритании в Россию</h1>
            <p className="mt-4">Начните экономить до 80% на шоппинге. Регистрируйтесь в OkeyPost, чтобы получить адрес в UK склада.</p>
            <Button className="mt-8" style={{ background: '#fff', color: 'var(--primary-purple)' }}>Получить адрес в UK</Button>
          </div>
          <div className="hero-img"><img src="/images/hero.png" alt="Hero" /></div>
        </div>
      </div>

      {/* КАТЕГОРИИ */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">Насколько выгодно покупать?</h2>
        <div className="category-strip">
          {mockCategories.map(cat => (
            <div key={cat.id} className="category-item">
              <img src={cat.img} alt={cat.name} style={{width: 48, height: 48, objectFit: 'contain'}} />
              <span>{cat.name}</span>
            </div>
          ))}
        </div>
      </div>

      {/* КУРТКА */}
      <div className="container mt-8">
        <div className="price-compare-card">
           <div className="compare-left">
             <h3>Columbia Barlow Pass 550 Turbodown Jacket</h3>
             <div className="price-box mt-4">
                <span style={{fontSize: 32}}>🇷🇺</span>
                <div><p className="text-muted" style={{fontSize: 14}}>Цена в России</p><b>7891,46₽</b></div>
             </div>
           </div>
           <div className="compare-center">
              <img src="/images/jacket.png" alt="Jacket" />
           </div>
           <div className="compare-right text-right">
             <h3>Доставка одежды из Великобритании <span style={{color: 'var(--primary-green)'}}>от £7.79</span></h3>
             <div className="price-box mt-4" style={{marginLeft: 'auto'}}>
                <div className="text-right"><p className="text-muted" style={{fontSize: 14}}>Цена в UK</p><b>£80.62</b></div>
                <span style={{fontSize: 32}}>🇬🇧</span>
             </div>
           </div>
        </div>
        <p className="text-center mt-4 text-muted">Срок доставки примерно 10 дней<br/><b style={{color: '#1A1A1A', fontSize: 18}}>Вы экономите до <span style={{color: 'var(--primary-green)'}}>$119.56</span></b></p>
      </div>

      {/* ПРЕИМУЩЕСТВА */}
      <div className="container mt-8">
        <div className="benefits-grid">
          <div className="benefit-card"><img src="/images/icons/benefit1.png" alt="" style={{width:40}}/><div><h4>Экономия до 70%</h4><p className="text-muted" style={{fontSize: 14}}>С ростом веса посылки цена уменьшается.</p></div></div>
          <div className="benefit-card"><img src="/images/icons/benefit2.png" alt="" style={{width:40}}/><div><h4>Только подлинная продукция</h4><p className="text-muted" style={{fontSize: 14}}>Мы работаем только с проверенными магазинами.</p></div></div>
          <div className="benefit-card"><img src="/images/icons/benefit3.png" alt="" style={{width:40}}/><div><h4>Оперативная доставка</h4><p className="text-muted" style={{fontSize: 14}}>Обработка не дольше 48 часов.</p></div></div>
          <div className="benefit-card"><img src="/images/icons/benefit4.png" alt="" style={{width:40}}/><div><h4>Огромный выбор</h4><p className="text-muted" style={{fontSize: 14}}>Тысячи магазинов по всему миру.</p></div></div>
        </div>
      </div>

      {/* КАЛЬКУЛЯТОР И ТАБЛИЦА */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">OkeyPost удобная и быстрая доставка посылок из Великобритании</h2>
        <DeliveryCalculator />
        <h3 className="title-h2 mt-8 mb-4" style={{fontSize: 24}}>Варианты доставки:</h3>
        <div className="delivery-list">
          {mockDeliveryOptions.map(opt => (
            <div key={opt.id} className="delivery-row">
              <div className="del-left"><img src={opt.img} alt="" style={{width:40}}/> <b>{opt.name}</b></div>
              <div className="del-mid"><span className="text-muted">Сроки:</span><br/><b>{opt.days}</b></div>
              <div className="del-mid"><span className="text-muted">Стоимость доставки:</span><br/><b>{opt.cost}</b></div>
              <div className="del-right"><span className="text-muted">Итого:</span><br/><b>{opt.total}</b></div>
            </div>
          ))}
        </div>
      </div>

      {/* 4 ШАГА */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">4 простых шага для ваших покупок в Великобритании</h2>
        <div className="steps-grid">
           <div className="step-item"><img src="/images/steps/1.png" style={{height:150, objectFit:'contain'}}/><div className="step-circle">1</div><h4>ВЫ ВЫБИРАЕТЕ ТОВАР</h4><p className="text-muted">В английском магазине, оплачиваете и указываете адрес склада.</p></div>
           <div className="step-item"><img src="/images/steps/2.png" style={{height:150, objectFit:'contain'}}/><div className="step-circle">2</div><h4>ПОКУПКИ ПРИХОДЯТ НА СКЛАД</h4><p className="text-muted">И появляются в вашем личном кабинете.</p></div>
           <div className="step-item"><img src="/images/steps/3.png" style={{height:150, objectFit:'contain'}}/><div className="step-circle">3</div><h4>ОТПРАВЛЯЕМ ИХ К ВАМ ДОМОЙ</h4><p className="text-muted">В надежной упаковке, по выгодной цене.</p></div>
           <div className="step-item"><img src="/images/steps/4.png" style={{height:150, objectFit:'contain'}}/><div className="step-circle">4</div><h4>ЗАБИРАЕТЕ СВОЮ ПОСЫЛКУ</h4><p className="text-muted">В пункте выдачи, на почте или с курьером.</p></div>
        </div>
      </div>

      {/* ОТЗЫВЫ */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">120 000 довольных клиентов в России уже сделали свой выбор</h2>
        <div className="reviews-grid">
          {mockReviews.map(rev => (
            <div key={rev.id} className="review-card">
              <img src={rev.img} alt="" style={{width: 100, height: 100, borderRadius: 12, objectFit: 'cover'}} />
              <div>
                <h4>{rev.name}</h4>
                <div style={{display: 'flex', gap: '4px', color: '#FFB800', margin: '8px 0'}}>
                  {[...Array(rev.stars)].map((_, i) => <Star key={i} size={16} fill="#FFB800" />)}
                </div>
                <p className="text-muted" style={{fontSize: 15, marginBottom: '12px'}}>{rev.text}</p>
                <div style={{fontSize: '13px', color: '#999'}}><span>Дата: {rev.date}</span> <br/> <span>Город: {rev.city}</span></div>
              </div>
            </div>
          ))}
        </div>
        <Button className="mt-4" variant="primary">Все отзывы</Button>
      </div>

      {/* ПОДПИСКА */}
      <div className="container mt-8">
         <div className="subscribe-banner">
            <div style={{maxWidth: '600px'}}><h2 style={{color: '#fff', fontSize: '32px'}}>Подпишитесь и будьте в курсе всех скидок и акций магазинов Великобритании!</h2></div>
            <div style={{display: 'flex', gap: '16px', background: 'rgba(255,255,255,0.2)', padding: '8px', borderRadius: '12px'}}>
               <input type="email" placeholder="Введите ваш email" style={{background: 'transparent', border: 'none', color: '#fff', outline: 'none', width: '250px', paddingLeft: '16px', fontSize: '16px'}} />
               <Button style={{background: 'var(--primary-green)', padding: '16px 32px'}}>Подписаться</Button>
            </div>
         </div>
      </div>
    </div>
  );
}
END

cat > src/pages/home-page/ui/home-page.css << 'END'
.hero-banner { background: linear-gradient(135deg, #5B52A3, #40B8EA); border-radius: 36px; padding: 80px; color: #fff; display: flex; justify-content: space-between; align-items: center; min-height: 600px; margin-bottom: 60px;}
.hero-text { max-width: 600px; z-index: 2; }
.hero-text h1 { font-size: 64px; line-height: 1.1; font-weight: 700; margin-bottom: 24px; }
.hero-img img { max-width: 500px; }
.category-strip { display: flex; justify-content: space-between; background: #fff; padding: 32px; border-radius: 24px; border: 1px solid var(--border); margin-bottom: 60px;}
.category-item { display: flex; flex-direction: column; align-items: center; gap: 16px; cursor: pointer; }
.category-item span { font-size: 16px; font-weight: 500; }
.price-compare-card { display: flex; justify-content: space-between; align-items: center; background: #fff; padding: 60px; border-radius: 36px; margin-bottom: 40px; border: 1px solid var(--border);}
.compare-center { width: 300px; height: 300px; background: #F5F7FA; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
.compare-center img { max-width: 110%; }
.price-box { display: flex; align-items: center; gap: 16px; background: #F5F7FA; padding: 16px 24px; border-radius: 16px; width: fit-content; }
.benefits-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; margin-bottom: 60px;}
.benefit-card { background: #fff; padding: 32px; border-radius: 24px; display: flex; gap: 20px; border: 1px solid var(--border); }
.delivery-list { display: flex; flex-direction: column; gap: 16px; margin-bottom: 60px;}
.delivery-row { display: flex; align-items: center; background: #fff; padding: 24px 32px; border-radius: 20px; border: 1px solid var(--border); }
.del-left { flex: 2; display: flex; align-items: center; gap: 16px; font-size: 18px;}
.del-mid { flex: 1; }
.del-right { flex: 1; text-align: right; }
.steps-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 32px; margin-bottom: 80px;}
.step-item { text-align: left; }
.step-circle { width: 48px; height: 48px; background: var(--primary-blue); color: #fff; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 24px; margin-bottom: 20px; margin-top: 16px;}
.reviews-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 32px; margin-bottom: 40px;}
.review-card { background: #fff; padding: 32px; border-radius: 24px; display: flex; gap: 24px; border: 1px solid var(--border); }
.subscribe-banner { background: linear-gradient(90deg, #5B52A3, #40B8EA); padding: 60px 80px; border-radius: 36px; display: flex; justify-content: space-between; align-items: center; }
@media (max-width: 1200px) {
  .hero-banner { flex-direction: column; padding: 40px; text-align: center; }
  .category-strip { flex-wrap: wrap; justify-content: center; gap: 30px; }
  .price-compare-card { flex-direction: column; gap: 40px; text-align: center; padding: 40px; }
  .benefits-grid { grid-template-columns: 1fr 1fr; }
  .delivery-row { flex-direction: column; align-items: flex-start; gap: 16px; }
  .del-right { text-align: left; }
  .steps-grid { grid-template-columns: 1fr 1fr; }
  .reviews-grid { grid-template-columns: 1fr; }
  .subscribe-banner { flex-direction: column; gap: 30px; text-align: center; padding: 40px; }
}
END

# 5. СТРАНИЦА ЦЕН (ПОЛНОСТЬЮ ПО FIGMA)
cat > src/pages/prices-page/ui/prices-page.jsx << 'END'
import { DeliveryCalculator } from '@/features/delivery-calculator';
import { mockDeliveryOptions } from '@/shared/mock/data';
import { Check } from 'lucide-react';
import './prices-page.css';

export default function PricesPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Услуги доставки из Великобритании</h1>
      
      {/* 4 карточки сверху */}
      <div className="services-grid mb-8">
        <div className="service-card"><h3>Ваш личный адрес для покупок</h3><p className="text-muted mt-4">Наш склад в Лондоне. Вы можете использовать его для всех покупок.</p><img src="/images/icons/service1.png" alt="" style={{height: 120, marginTop: 20}}/></div>
        <div className="service-card"><h3>Объединение нескольких посылок в одну</h3><p className="text-muted mt-4">Мы экономим ваши деньги на доставке, объединяя посылки.</p><img src="/images/icons/service2.png" alt="" style={{height: 120, marginTop: 20}}/></div>
        <div className="service-card"><h3>Усиленная упаковка по запросу</h3><p className="text-muted mt-4">Дополнительная защита для хрупких товаров.</p><img src="/images/icons/service3.png" alt="" style={{height: 120, marginTop: 20}}/></div>
        <div className="service-card"><h3>Хранение посылок 30 дней</h3><p className="text-muted mt-4">Бесплатно храним ваши покупки целый месяц.</p><img src="/images/icons/service4.png" alt="" style={{height: 120, marginTop: 20}}/></div>
      </div>

      <h2 className="title-h2 mb-4">Онлайн-калькулятор стоимости доставки товара</h2>
      <DeliveryCalculator />

      <h2 className="title-h2 mt-8 mb-4">Варианты доставки:</h2>
      <div className="table-container mb-8">
        {mockDeliveryOptions.map(opt => (
          <div key={opt.id} className="table-row">
            <div style={{flex: 2, display: 'flex', alignItems: 'center', gap: '16px'}}><img src={opt.img} alt="" style={{width: 32}}/> <b>{opt.name}</b></div>
            <div style={{flex: 1}}><span className="text-muted" style={{fontSize: 14}}>Сроки:</span><br/><b>{opt.days}</b></div>
            <div style={{flex: 1}}><span className="text-muted" style={{fontSize: 14}}>Стоимость:</span><br/><b>{opt.cost}</b></div>
            <div style={{flex: 1}}><span className="text-muted" style={{fontSize: 14}}>Итого:</span><br/><b>{opt.total}</b></div>
            <div><Check size={24} color="var(--primary-green)"/></div>
          </div>
        ))}
      </div>

      <h2 className="title-h2 mt-8 mb-4">Услуги склада</h2>
      <div className="table-container mb-8" style={{display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 0}}>
        <div className="table-row" style={{borderRight: '1px solid var(--border)'}}><div style={{flex: 1}}>Консолидация</div><div style={{flex: 1, textAlign: 'right'}}>£1.00 / шт</div></div>
        <div className="table-row"><div style={{flex: 1}}>Заполнение декларации</div><div style={{flex: 1, textAlign: 'right'}}>£5.00</div></div>
        <div className="table-row" style={{borderRight: '1px solid var(--border)'}}><div style={{flex: 1}}>Дополнительная упаковка</div><div style={{flex: 1, textAlign: 'right'}}>£3.00</div></div>
        <div className="table-row"><div style={{flex: 1}}>Упаковка хрупких предметов</div><div style={{flex: 1, textAlign: 'right'}}>£10.00</div></div>
      </div>
      <div className="table-container mb-8">
        <div className="table-row"><div style={{flex: 2}}>Сборка исходящей посылки вне очереди или экспресс сборка<br/><span className="text-muted" style={{fontSize: 12}}>Услуга «Срочный сбор»</span></div><div style={{flex: 1, textAlign: 'right'}}><b>£5.00</b></div></div>
        <div className="table-row"><div style={{flex: 2}}>Фото содержимого входящей посылки<br/><span className="text-muted" style={{fontSize: 12}}>3 фото за 35 р, 6 фото за 55 р</span></div><div style={{flex: 1, textAlign: 'right'}}><b>£1.00 за 1 фото</b></div></div>
        <div className="table-row"><div style={{flex: 2}}>Возврат вещей в магазин<br/><span className="text-muted" style={{fontSize: 12}}>В случае, если вещь не подошла</span></div><div style={{flex: 1, textAlign: 'right'}}><b>£10 + почтовые расходы</b></div></div>
        <div className="table-row"><div style={{flex: 2}}>Проверка техники на работоспособность<br/><span className="text-muted" style={{fontSize: 12}}>Проверяем включение</span></div><div style={{flex: 1, textAlign: 'right'}}><b>£10</b></div></div>
        <div className="table-row"><div style={{flex: 2}}>Удаление инвойса<br/><span className="text-muted" style={{fontSize: 12}}>Удаляем бумаги</span></div><div style={{flex: 1, textAlign: 'right'}}><b>Бесплатно</b></div></div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Покупки с операторами Okeypost.com</h2>
      <div className="table-container mb-8">
        <div className="table-row"><div style={{flex: 2}}>Быстрое оформление покупок в интернет-магазинах<br/><span className="text-muted" style={{fontSize: 12}}>Вы покупаете товары, мы оформляем</span></div><div style={{flex: 1, textAlign: 'right'}}><b>5% от стоимости товара, минимум £7</b></div></div>
        <div className="table-row"><div style={{flex: 2}}>Фото товара по услуге "Покупка с оператором"<br/><span className="text-muted" style={{fontSize: 12}}>Три фото выбранного товара</span></div><div style={{flex: 1, textAlign: 'right'}}><b>£2</b></div></div>
      </div>

      <div className="operator-banner mb-8">
        <div style={{maxWidth: '500px'}}>
          <h2 style={{color: '#fff', fontSize: 32, marginBottom: 16}}>Попробуйте заказывать с оператором прямо сейчас.</h2>
          <p style={{color: 'rgba(255,255,255,0.8)', marginBottom: 24}}>Пришлите ссылку на товар, его купят и доставят на наш склад в кратчайшие сроки.</p>
          <div style={{display: 'flex', gap: 16}}><input type="text" placeholder="Введите ссылку на товар" style={{padding: 12, borderRadius: 8, border: 'none', width: '100%'}} /><Button style={{background: 'var(--primary-green)', whiteSpace: 'nowrap'}}>Отправить</Button></div>
        </div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Страхование</h2>
      <div className="table-container mb-8">
        <div className="table-row"><div style={{flex: 2}}>Дополнительное страхование</div><div style={{flex: 1, textAlign: 'right'}}>5% от суммы, на которую хотите застраховать</div></div>
        <div className="table-row"><div style={{flex: 2}}>Почта России и ЕМС</div><div style={{flex: 1, textAlign: 'right'}}>Застраховано по умолчанию на £50.00</div></div>
        <div className="table-row"><div style={{flex: 2}}>Мелкие пакеты</div><div style={{flex: 1, textAlign: 'right'}}>Застраховано на £20.00</div></div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Дополнительная упаковка</h2>
      <div className="table-container" style={{display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 0}}>
        <div className="table-row" style={{borderRight: '1px solid var(--border)'}}><div style={{flex: 1}}>Многослойная пленка</div><div style={{flex: 1, textAlign: 'right'}}>£1.99</div></div>
        <div className="table-row"><div style={{flex: 1}}>Упаковка в пакет</div><div style={{flex: 1, textAlign: 'right'}}>£1.99</div></div>
        <div className="table-row" style={{borderRight: '1px solid var(--border)'}}><div style={{flex: 1}}>Упаковка в коробку с двойными стенками</div><div style={{flex: 1, textAlign: 'right'}}>£4.99</div></div>
        <div className="table-row"><div style={{flex: 1}}>Наклейка "Обращаться с осторожностью"</div><div style={{flex: 1, textAlign: 'right'}}>£0.25</div></div>
      </div>
    </div>
  );
}
END

cat > src/pages/prices-page/ui/prices-page.css << 'END'
.services-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; }
.service-card { background: #fff; padding: 32px; border-radius: 24px; border: 1px solid var(--border); display: flex; flex-direction: column; justify-content: space-between; }
.service-card h3 { font-size: 18px; font-weight: 600; line-height: 1.4; }
.table-container { background: #fff; border-radius: 16px; border: 1px solid var(--border); overflow: hidden; }
.table-row { display: flex; align-items: center; padding: 24px 32px; border-bottom: 1px solid var(--border); font-size: 15px; }
.table-row:last-child { border-bottom: none; }
.operator-banner { background: linear-gradient(90deg, #5B52A3, #40B8EA); padding: 48px; border-radius: 24px; }
@media (max-width: 1200px) {
  .services-grid { grid-template-columns: 1fr 1fr; }
}
@media (max-width: 768px) {
  .services-grid { grid-template-columns: 1fr; }
  .table-row { flex-direction: column; align-items: flex-start; gap: 12px; }
  .table-container { grid-template-columns: 1fr !important; }
  .table-container .table-row { border-right: none !important; }
}
END

# 6. FAQ, ЗАКАЗЫ, ПРОФИЛЬ (Оставляем рабочую логику)
# (Файлы не меняем, они уже нормальные, меняем только стили контейнера в global.css)

echo "✅ ВСЁ ГОТОВО!"
