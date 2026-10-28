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
