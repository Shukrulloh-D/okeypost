import { Calculator } from '@/features/calculator';
import { mockDeliveryOptions } from '@/shared/mock/data';
import { Check } from 'lucide-react';
import { Button } from '@/shared/ui/button';
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
