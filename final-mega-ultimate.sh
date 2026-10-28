#!/bin/bash
echo "🚀 Запуск МЕГА-СБОРКИ (Наполняем контентом и логикой)..."

# ==========================================
# 1. ОБНОВЛЯЕМ ДАННЫЕ (MOCK)
# ==========================================
cat > src/shared/mock/data.js << 'END'
export const mockCategories = [
  { id: 1, name: 'Одежда', icon: 'Shirt' },
  { id: 2, name: 'Электроника', icon: 'Laptop' },
  { id: 3, name: 'Аксессуары', icon: 'ShoppingBag' },
  { id: 4, name: 'Для детей', icon: 'Baby' },
  { id: 5, name: 'Для спорта', icon: 'Dumbbell' },
  { id: 6, name: 'Косметика', icon: 'Sparkles' },
];

export const mockDeliveryOptions = [
  { id: 1, name: 'ПОЧТА РОССИИ', days: '10-14 дней', cost: 'от £27.00', total: '£41.99', icon: 'Building2' },
  { id: 2, name: 'EMS ПОЧТА РОССИИ', days: '9-12 дней', cost: 'от £40.00', total: '£54.55', icon: 'Plane' },
  { id: 3, name: 'ПОЧТА РОССИИ МЕЛКИЕ ПАКЕТЫ', days: '10-14 дней', cost: 'от £13.00', total: '£30.50', icon: 'Package' },
];

export const mockReviews = [
  { id: 1, name: 'NIKOLAY S', stars: 5, text: 'Ваша доставка самая быстрая и дешёвая!!!', date: '16 Ноября 2021', city: 'Санкт-Петербург' },
  { id: 2, name: 'DMITRIY D', stars: 5, text: 'Пуховик Levi\'s с eBay. Всё приехало быстро и целым.', date: '16 Ноября 2021', city: 'Москва' },
  { id: 3, name: 'VLADIMIR E', stars: 5, text: 'Отзыв, как всегда! Отдельное спасибо за упаковку, часики от Apple пришли в целости.', date: '16 Ноября 2021', city: 'Санкт-Петербург' },
  { id: 4, name: 'Оксана', stars: 5, text: 'Очень быстро, надежно! Как всегда большое спасибо за работу!', date: '16 Ноября 2021', city: 'Odintsovo' },
];

export const mockFaqData = [
  { category: 'Виртуальный адрес в Великобритании', items: [
    { id: 1, q: 'Что делать, если вы забыли внести трек-номер?', a: 'Свяжитесь с поддержкой, мы добавим его вручную.' },
    { id: 2, q: 'Как я узнаю, что заказ пришел на склад?', a: 'Вам придет SMS-уведомление и письмо на почту.' },
    { id: 3, q: 'Сколько стоит виртуальный адрес?', a: 'Бесплатно при регистрации.' },
  ]},
  { category: 'Покупки в магазинах Англии', items: [
    { id: 4, q: 'Анонс скидочных купонов и промокодов', a: 'Мы публикуем их в нашем блоге каждую неделю.' },
    { id: 5, q: 'Как узнать пришел ли заказ полностью?', a: 'В личном кабинете статус изменится на "На складе".' },
  ]},
  { category: 'Доставка из Англии', items: [
    { id: 6, q: 'Как часто вы отправляете посылки в Россию?', a: 'Еженедельно, по мере комплектации.' },
    { id: 7, q: 'Возможно ли доставка в страны, не указанные на сайте?', a: 'Да, напишите в поддержку для расчета.' },
  ]}
];

export const mockStores = [
  { id: 1, name: 'PRIMARK', logo: '/images/store1.png' },
  { id: 2, name: 'H&M', logo: '/images/store2.png' },
  { id: 3, name: 'MANGO', logo: '/images/store3.png' },
  { id: 4, name: 'ZARA', logo: '/images/store4.png' },
  { id: 5, name: 'ASOS', logo: '/images/store5.png' },
  { id: 6, name: 'eBay', logo: '/images/store6.png' },
];
END

# ==========================================
# 2. ОБНОВЛЯЕМ HEADER (Добавляем Бонусы и логику Вход/Профиль)
# ==========================================
cat > src/widgets/header/ui/header.jsx << 'END'
import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import { useAuthStore } from '@/shared/store/auth-store';
import { User, Search, Menu } from 'lucide-react';
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
          
          {/* Логика: если авторизован - Профиль, если нет - Вход */}
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

# ==========================================
# 3. ГЛАВНАЯ СТРАНИЦА (Максимально длинная, как в Figma)
# ==========================================
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { StoreCard } from '@/entities/store-card';
import { DeliveryCalculator } from '@/features/delivery-calculator';
import { mockStores, mockCategories, mockDeliveryOptions, mockReviews } from '@/shared/mock/data';
import { ShieldCheck, Truck, Banknote, Package, Shirt, Laptop, ShoppingBag, Baby, Dumbbell, Sparkles, Building2, Plane, Star, Mail } from 'lucide-react';
import './home-page.css';

export default function HomePage() {
  const iconMap = { Shirt, Laptop, ShoppingBag, Baby, Dumbbell, Sparkles };
  const deliveryIconMap = { Building2, Plane, Package };

  return (
    <div>
      {/* 1. HERO */}
      <div className="container mt-8">
        <div className="hero-banner">
          <div className="hero-text">
            <h1>Доставка товаров из Великобритании в Россию</h1>
            <p className="mt-4">Начните экономить до 80% на шоппинге. Регистрируйтесь в OkeyPost, чтобы получить адрес в UK склада.</p>
            <Button className="mt-8" style={{ background: '#fff', color: 'var(--primary-purple)' }}>Получить адрес в UK</Button>
          </div>
          <div className="hero-img">
             <img src="/images/hero-illustration.png" alt="Hero" onError={(e) => {e.target.style.display='none';}} />
          </div>
        </div>
      </div>

      {/* 2. КАТЕГОРИИ */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">Насколько выгодно покупать?</h2>
        <div className="category-strip">
          {mockCategories.map(cat => {
            const Icon = iconMap[cat.icon] || Package;
            return (
              <div key={cat.id} className="category-item">
                <Icon size={32} color="var(--primary-blue)" />
                <span>{cat.name}</span>
              </div>
            );
          })}
        </div>
      </div>

      {/* 3. СРАВНЕНИЕ ЦЕН (ДЖАКЕТ) */}
      <div className="container mt-8">
        <div className="price-compare-card">
           <div className="compare-left">
             <h3>Columbia Barlow Pass 550 Turbodown Jacket</h3>
             <div className="price-box mt-4">
                <span className="flag">🇷🇺</span>
                <div><p className="text-muted" style={{fontSize: 12}}>Цена в России</p><b>7891,46₽</b></div>
             </div>
           </div>
           <div className="compare-center">
              <div className="circle-img">
                 {/* Место для картинки куртки */}
                 <img src="/images/jacket.png" alt="Jacket" onError={(e) => {e.target.style.display='none';}} />
              </div>
           </div>
           <div className="compare-right text-right">
             <h3>Доставка одежды из Великобритании <span style={{color: 'var(--primary-green)'}}>от £7.79</span></h3>
             <div className="price-box mt-4" style={{justifyContent: 'flex-end'}}>
                <div className="text-right"><p className="text-muted" style={{fontSize: 12}}>Цена в UK</p><b>£80.62</b></div>
                <span className="flag">🇬🇧</span>
             </div>
           </div>
        </div>
        <p className="text-center mt-4 text-muted">Срок доставки примерно 10 дней<br/><b style={{color: '#1A1A1A'}}>Вы экономите до <span style={{color: 'var(--primary-green)'}}>$119.56</span></b></p>
      </div>

      {/* 4. ПРЕИМУЩЕСТВА */}
      <div className="container mt-8">
        <div className="benefits-grid">
          <div className="benefit-card"><Banknote size={32} color="var(--primary-blue)"/><div><h4>Экономия до 70%</h4><p className="text-muted" style={{fontSize: 12}}>С ростом веса посылки цена уменьшается.</p></div></div>
          <div className="benefit-card"><ShieldCheck size={32} color="var(--primary-blue)"/><div><h4>Только подлинная продукция</h4><p className="text-muted" style={{fontSize: 12}}>Мы работаем только с проверенными магазинами.</p></div></div>
          <div className="benefit-card"><Truck size={32} color="var(--primary-blue)"/><div><h4>Оперативная доставка</h4><p className="text-muted" style={{fontSize: 12}}>Обработка не дольше 48 часов.</p></div></div>
          <div className="benefit-card"><Package size={32} color="var(--primary-blue)"/><div><h4>Огромный выбор</h4><p className="text-muted" style={{fontSize: 12}}>Тысячи магазинов по всему миру.</p></div></div>
        </div>
      </div>

      {/* 5. КАЛЬКУЛЯТОР И ДОСТАВКА */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">OkeyPost удобная и быстрая доставка посылок из Великобритании</h2>
        <DeliveryCalculator />
        
        <h3 className="title-h2 mt-8 mb-4" style={{fontSize: 20}}>Варианты доставки:</h3>
        <div className="delivery-list">
          {mockDeliveryOptions.map(opt => {
            const Icon = deliveryIconMap[opt.icon] || Package;
            return (
              <div key={opt.id} className="delivery-row">
                <div className="del-left"><Icon size={24} color="var(--primary-blue)" /> <b>{opt.name}</b></div>
                <div className="del-mid"><span className="text-muted">Сроки:</span> {opt.days}</div>
                <div className="del-mid"><span className="text-muted">Стоимость:</span> {opt.cost}</div>
                <div className="del-right"><span className="text-muted">Итого:</span> <b>{opt.total}</b></div>
              </div>
            );
          })}
        </div>
      </div>

      {/* 6. 4 ШАГА */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">4 простых шага для ваших покупок в Великобритании</h2>
        <div className="steps-grid">
           <div className="step-item"><div className="step-circle">1</div><h4>ВЫ ВЫБИРАЕТЕ ТОВАР</h4><p className="text-muted">В английском магазине, оплачиваете и указываете адрес склада.</p></div>
           <div className="step-item"><div className="step-circle">2</div><h4>ПОКУПКИ ПРИХОДЯТ НА СКЛАД</h4><p className="text-muted">И появляются в вашем личном кабинете.</p></div>
           <div className="step-item"><div className="step-circle">3</div><h4>ОТПРАВЛЯЕМ ИХ К ВАМ ДОМОЙ</h4><p className="text-muted">В надежной упаковке, по выгодной цене.</p></div>
           <div className="step-item"><div className="step-circle">4</div><h4>ЗАБИРАЕТЕ СВОЮ ПОСЫЛКУ</h4><p className="text-muted">В пункте выдачи, на почте или с курьером.</p></div>
        </div>
      </div>

      {/* 7. ОТЗЫВЫ */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">120 000 довольных клиентов в России уже сделали свой выбор</h2>
        <div className="reviews-grid">
          {mockReviews.map(rev => (
            <div key={rev.id} className="review-card">
              <div className="review-img" style={{background: '#E0E0E0', width: '100px', height: '100px', borderRadius: '12px', flexShrink: 0}}></div>
              <div>
                <h4>{rev.name}</h4>
                <div style={{display: 'flex', gap: '2px', color: '#FFB800', margin: '4px 0'}}>
                  {[...Array(rev.stars)].map((_, i) => <Star key={i} size={14} fill="#FFB800" />)}
                </div>
                <p className="text-muted" style={{fontSize: 13, marginBottom: '8px'}}>{rev.text}</p>
                <div style={{fontSize: '11px', color: '#999'}}><span>Дата: {rev.date}</span> <br/> <span>Город: {rev.city}</span></div>
              </div>
            </div>
          ))}
        </div>
        <Button className="mt-4" variant="primary">Все отзывы</Button>
      </div>

      {/* 8. ПОДПИСКА */}
      <div className="container mt-8">
         <div className="subscribe-banner">
            <div>
              <h2 style={{color: '#fff', fontSize: '28px'}}>Подпишитесь и будьте в курсе всех скидок и акций магазинов Великобритании!</h2>
            </div>
            <div style={{display: 'flex', gap: '10px', background: 'rgba(255,255,255,0.1)', padding: '10px', borderRadius: '8px'}}>
               <input type="email" placeholder="Введите ваш email" style={{background: 'transparent', border: 'none', color: '#fff', outline: 'none', width: '200px'}} />
               <Button style={{background: 'var(--primary-green)'}}>Подписаться</Button>
            </div>
         </div>
      </div>
    </div>
  );
}
END

# Стили для Главной
cat > src/pages/home-page/ui/home-page.css << 'END'
.hero-banner { background: linear-gradient(135deg, #5B52A3, #40B8EA); border-radius: 36px; padding: 60px 80px; color: #fff; display: flex; justify-content: space-between; align-items: center; min-height: 480px; overflow: hidden; }
.hero-text { max-width: 550px; z-index: 2; }
.hero-text h1 { font-size: 48px; line-height: 1.1; font-weight: 700; }
.hero-img img { max-width: 450px; height: auto; object-fit: contain; }

.category-strip { display: flex; justify-content: space-between; background: #fff; padding: 24px; border-radius: 16px; border: 1px solid var(--border); overflow-x: auto; }
.category-item { display: flex; flex-direction: column; align-items: center; gap: 12px; min-width: 100px; cursor: pointer; }
.category-item span { font-size: 13px; font-weight: 500; }

.price-compare-card { display: flex; justify-content: space-between; align-items: center; background: #fff; padding: 40px; border-radius: 24px; }
.compare-left, .compare-right { flex: 1; }
.compare-center { width: 250px; height: 250px; background: #F5F7FA; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
.price-box { display: flex; align-items: center; gap: 12px; background: #F5F7FA; padding: 12px 24px; border-radius: 12px; width: fit-content; }
.flag { font-size: 24px; }

.benefits-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
.benefit-card { background: #fff; padding: 24px; border-radius: 16px; display: flex; align-items: flex-start; gap: 16px; border: 1px solid var(--border); }

.delivery-list { display: flex; flex-direction: column; gap: 12px; }
.delivery-row { display: flex; align-items: center; background: #fff; padding: 20px 24px; border-radius: 12px; border: 1px solid var(--border); }
.del-left { flex: 2; display: flex; align-items: center; gap: 12px; }
.del-mid { flex: 1; font-size: 14px; }
.del-right { flex: 1; text-align: right; font-size: 16px; }

.steps-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; }
.step-item { text-align: left; }
.step-circle { width: 40px; height: 40px; background: var(--primary-blue); color: #fff; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 18px; margin-bottom: 16px; }
.step-item h4 { font-size: 14px; margin-bottom: 8px; text-transform: uppercase; }

.reviews-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; }
.review-card { background: #fff; padding: 20px; border-radius: 16px; display: flex; gap: 20px; border: 1px solid var(--border); }

.subscribe-banner { background: linear-gradient(90deg, #5B52A3, #40B8EA); padding: 40px; border-radius: 24px; display: flex; justify-content: space-between; align-items: center; }

@media (max-width: 992px) {
  .hero-banner { flex-direction: column; padding: 40px; text-align: center; }
  .category-strip { flex-wrap: wrap; justify-content: center; gap: 20px; }
  .price-compare-card { flex-direction: column; gap: 30px; text-align: center; }
  .price-box { margin: 0 auto; }
  .benefits-grid { grid-template-columns: 1fr 1fr; }
  .delivery-row { flex-direction: column; align-items: flex-start; gap: 10px; }
  .del-right { text-align: left; }
  .steps-grid { grid-template-columns: 1fr 1fr; }
  .reviews-grid { grid-template-columns: 1fr; }
  .subscribe-banner { flex-direction: column; gap: 20px; text-align: center; }
}
END

# ==========================================
# 4. СТРАНИЦА ЦЕН (Длинная, с таблицами)
# ==========================================
cat > src/pages/prices-page/ui/prices-page.jsx << 'END'
import { DeliveryCalculator } from '@/features/delivery-calculator';
import { mockDeliveryOptions } from '@/shared/mock/data';
import { Building2, Plane, Package, Check } from 'lucide-react';
import './prices-page.css';

export default function PricesPage() {
  const deliveryIconMap = { Building2, Plane, Package };

  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Услуги доставки из Великобритании</h1>
      
      {/* Карточки услуг */}
      <div className="services-grid mb-8">
        <div className="service-card">
          <h3>Ваш личный адрес для покупок</h3>
          <p className="text-muted mt-4">Наш склад в Лондоне. Вы можете использовать его для всех покупок.</p>
        </div>
        <div className="service-card">
          <h3>Объединение нескольких посылок в одну</h3>
          <p className="text-muted mt-4">Мы экономим ваши деньги на доставке, объединяя посылки.</p>
        </div>
        <div className="service-card">
          <h3>Усиленная упаковка по запросу</h3>
          <p className="text-muted mt-4">Дополнительная защита для хрупких товаров.</p>
        </div>
        <div className="service-card">
          <h3>Хранение посылок 30 дней</h3>
          <p className="text-muted mt-4">Бесплатно храним ваши покупки целый месяц.</p>
        </div>
      </div>

      <h2 className="title-h2 mb-4">Онлайн-калькулятор стоимости доставки товара</h2>
      <DeliveryCalculator />

      <h2 className="title-h2 mt-8 mb-4">Варианты доставки:</h2>
      <div className="table-container">
        {mockDeliveryOptions.map(opt => {
          const Icon = deliveryIconMap[opt.icon] || Package;
          return (
            <div key={opt.id} className="table-row">
              <div style={{flex: 2, display: 'flex', alignItems: 'center', gap: '12px'}}><Icon size={20} color="var(--primary-blue)"/> <b>{opt.name}</b></div>
              <div style={{flex: 1}}><span className="text-muted" style={{fontSize: 12}}>Сроки:</span><br/>{opt.days}</div>
              <div style={{flex: 1}}><span className="text-muted" style={{fontSize: 12}}>Стоимость:</span><br/>{opt.cost}</div>
              <div style={{flex: 1}}><span className="text-muted" style={{fontSize: 12}}>Итого:</span><br/><b>{opt.total}</b></div>
              <div><Check size={20} color="var(--primary-green)"/></div>
            </div>
          );
        })}
      </div>

      <h2 className="title-h2 mt-8 mb-4">Услуги склада</h2>
      <div className="table-container">
        <div className="table-row"><div style={{flex: 2}}>Консолидация</div><div style={{flex: 1}}>£1.00 / шт</div></div>
        <div className="table-row"><div style={{flex: 2}}>Дополнительная упаковка</div><div style={{flex: 1}}>£3.00</div></div>
        <div className="table-row"><div style={{flex: 2}}>Заполнение декларации</div><div style={{flex: 1}}>£5.00</div></div>
        <div className="table-row"><div style={{flex: 2}}>Проверка комплектации</div><div style={{flex: 1}}>£3.00 / 10 мин</div></div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Страхование</h2>
      <div className="table-container">
        <div className="table-row"><div style={{flex: 2}}>Дополнительное страхование</div><div style={{flex: 1}}>5% от суммы заказа</div></div>
        <div className="table-row"><div style={{flex: 2}}>Потеря посылки в РФ</div><div style={{flex: 1}}>Возмещение до £50.00</div></div>
      </div>
    </div>
  );
}
END

cat > src/pages/prices-page/ui/prices-page.css << 'END'
.services-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
.service-card { background: #fff; padding: 24px; border-radius: 16px; border: 1px solid var(--border); }
.table-container { background: #fff; border-radius: 16px; border: 1px solid var(--border); overflow: hidden; }
.table-row { display: flex; align-items: center; padding: 20px 24px; border-bottom: 1px solid var(--border); font-size: 14px; }
.table-row:last-child { border-bottom: none; }
@media (max-width: 992px) {
  .services-grid { grid-template-columns: 1fr; }
  .table-row { flex-direction: column; align-items: flex-start; gap: 10px; }
}
END

# ==========================================
# 5. СТРАНИЦА FAQ (С поиском и категориями)
# ==========================================
cat > src/pages/faq-page/ui/faq-page.jsx << 'END'
import { useState } from 'react';
import { mockFaqData } from '@/shared/mock/data';
import { Search, ChevronDown } from 'lucide-react';
import './faq-page.css';

export default function FaqPage() {
  const [search, setSearch] = useState('');
  const [openId, setOpenId] = useState(null);

  return (
    <div className="container page-wrapper" style={{ maxWidth: '900px' }}>
      <h1 className="title-h1 mb-8 text-center">Часто задаваемые вопросы</h1>
      
      <div className="faq-search-box mb-8">
        <input 
          type="text" 
          placeholder="Поиск по вопросам и ответам..." 
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />
        <Search size={20} color="var(--primary-blue)" />
      </div>

      {mockFaqData.map((category, idx) => (
        <div key={idx} className="mb-8">
          <h3 className="faq-category-title">{category.category}</h3>
          <div className="faq-list">
            {category.items.filter(item => item.q.toLowerCase().includes(search.toLowerCase())).map(item => (
              <div key={item.id} className="faq-item">
                <div onClick={() => setOpenId(openId === item.id ? null : item.id)} className="faq-question">
                  {item.q} <ChevronDown size={20} className={openId === item.id ? 'rotate' : ''} />
                </div>
                {openId === item.id && <div className="faq-answer">{item.a}</div>}
              </div>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}
END

cat > src/pages/faq-page/ui/faq-page.css << 'END'
.faq-search-box { display: flex; align-items: center; background: #fff; padding: 16px 24px; border-radius: 12px; border: 1px solid var(--border); }
.faq-search-box input { flex: 1; border: none; outline: none; font-size: 16px; }
.faq-category-title { font-size: 20px; font-weight: 700; margin-bottom: 16px; }
.faq-item { background: #fff; margin-bottom: 8px; border-radius: 8px; border: 1px solid var(--border); overflow: hidden; }
.faq-question { padding: 20px; cursor: pointer; display: flex; justify-content: space-between; font-weight: 600; font-size: 15px; }
.faq-question svg { transition: 0.3s; }
.faq-question svg.rotate { transform: rotate(180deg); }
.faq-answer { padding: 0 20px 20px; color: var(--text-muted); line-height: 1.6; }
END

# ==========================================
# 6. ЗАГЛУШКИ ДЛЯ ДРУГА (Наполненные, чтобы не было пусто)
# ==========================================
# Как покупать
cat > src/pages/how-to-buy-page/ui/how-to-buy-page.jsx << 'END'
export default function HowToBuyPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Как покупать в Великобритании</h1>
      <div style={{ background: '#fff', padding: '40px', borderRadius: '24px', border: '2px dashed var(--primary-blue)' }}>
        <h2 style={{ color: 'var(--primary-blue)', marginBottom: '20px' }}>Территория друга (Верстка)</h2>
        <p className="text-muted mb-4">Друг, сверстай тут 5 шагов покупки, как на макете Figma.</p>
        <div style={{ display: 'grid', gap: '20px' }}>
           {[1,2,3,4,5].map(i => (
             <div key={i} style={{ display: 'flex', gap: '20px', background: '#F5F7FA', padding: '20px', borderRadius: '12px' }}>
               <div style={{ width: '60px', height: '60px', background: '#E0E0E0', borderRadius: '8px' }}></div>
               <div><h4>Шаг {i}</h4><p className="text-muted">Описание шага...</p></div>
             </div>
           ))}
        </div>
      </div>
    </div>
  );
}
END

# Распродажи
cat > src/pages/sales-page/ui/sales-page.jsx << 'END'
export default function SalesPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Распродажи</h1>
      <div style={{ background: '#fff', padding: '40px', borderRadius: '24px', border: '2px dashed var(--primary-blue)' }}>
        <h2 style={{ color: 'var(--primary-blue)', marginBottom: '20px' }}>Территория друга (Верстка)</h2>
        <p className="text-muted mb-4">Друг, сделай сетку карточек магазинов со скидками (Black Friday).</p>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(250px, 1fr))', gap: '20px' }}>
           {[1,2,3,4,5,6].map(i => (
             <div key={i} style={{ background: '#F5F7FA', height: '200px', borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>Карточка магазина</div>
           ))}
        </div>
      </div>
    </div>
  );
}
END

# Блог
cat > src/pages/blog-page/ui/blog-page.jsx << 'END'
export default function BlogPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Блог</h1>
      <div style={{ background: '#fff', padding: '40px', borderRadius: '24px', border: '2px dashed var(--primary-blue)' }}>
        <h2 style={{ color: 'var(--primary-blue)', marginBottom: '20px' }}>Территория друга (Верстка)</h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '20px' }}>
           {[1,2,3,4,5,6].map(i => (
             <div key={i} style={{ background: '#F5F7FA', height: '300px', borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>Карточка статьи</div>
           ))}
        </div>
      </div>
    </div>
  );
}
END

# Магазины (Красивая сетка)
cat > src/pages/stores-page/ui/stores-page.jsx << 'END'
import { StoreCard } from '@/entities/store-card';
import { mockStores } from '@/shared/mock/data';

export default function StoresPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Популярные магазины</h1>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))', gap: '24px' }}>
        {[...mockStores, ...mockStores, ...mockStores].map((store, index) => (
          <StoreCard key={`${store.id}-${index}`} store={store} />
        ))}
      </div>
    </div>
  );
}
END

# Партнерка
cat > src/pages/partnership-page/ui/partnership-page.jsx << 'END'
export default function PartnershipPage() {
  return (
    <div className="container page-wrapper">
      <div style={{ background: 'linear-gradient(90deg, #5B52A3, #40B8EA)', padding: '60px', borderRadius: '24px', color: '#fff', marginBottom: '40px' }}>
        <h1 className="title-h1">Бонусы и партнерская программа</h1>
        <p className="mt-4" style={{fontSize: '18px'}}>Платим $3 с каждой отправленной посылки.</p>
      </div>
      <h2 className="title-h2 mb-8">Зарабатывать с нами — проще простого:</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' }}>
        <div style={{ background: '#fff', padding: '24px', borderRadius: '16px', border: '1px solid var(--border)' }}>
           <h4>Дарим около 10% назад бонусами</h4>
           <p className="text-muted mt-4">Копите бонусы и тратьте их на следующие покупки.</p>
        </div>
        <div style={{ background: '#fff', padding: '24px', borderRadius: '16px', border: '1px solid var(--border)' }}>
           <h4>Платим по $3 за отправленную посылку</h4>
           <p className="text-muted mt-4">Приглашайте друзей и получайте вознаграждение.</p>
        </div>
      </div>
    </div>
  );
}
END

echo "✅ МЕГА-СБОРКА ЗАВЕРШЕНА!"
echo "Перезапусти сервер (Ctrl+C, затем npm run dev)."
echo "Теперь на сайте есть всё: длинные страницы, калькуляторы, таблицы, отзывы и логика хедера."
