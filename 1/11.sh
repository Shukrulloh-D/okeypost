#!/bin/bash
echo "🏠 Собираем Главную страницу..."

cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { StoreCard } from '@/entities/store-card';
import { mockStores } from '@/shared/mock/data';
import { ShieldCheck, Truck, Banknote, Package } from 'lucide-react';
import './home-page.css';

export default function HomePage() {
  return (
    <div>
      {/* HERO SECTION */}
      <div className="container mt-8">
        <div className="hero-banner">
          <div className="hero-text">
            <h1>Доставка товаров из Великобритании в Россию</h1>
            <p className="mt-4">Начните экономить до 80% на шоппинге. Регистрируйтесь в OkeyPost, чтобы получить адрес в UK склада.</p>
            <Button className="mt-8" style={{ background: '#fff', color: 'var(--primary-purple)' }}>Получить адрес в UK</Button>
          </div>
          <div className="hero-img">
             {/* Сюда друг поставит картинку из Figma */}
             <img src="/images/hero-illustration.png" alt="Hero Illustration" />
          </div>
        </div>
      </div>

      {/* BENEFITS SECTION */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-8">Насколько выгодно покупать?</h2>
        <div className="benefits-grid">
          <div className="benefit-card"><Banknote size={32} color="var(--primary-blue)"/><h4>Экономия до 70%</h4></div>
          <div className="benefit-card"><ShieldCheck size={32} color="var(--primary-blue)"/><h4>Точный подбор</h4></div>
          <div className="benefit-card"><Truck size={32} color="var(--primary-blue)"/><h4>Оперативная доставка</h4></div>
          <div className="benefit-card"><Package size={32} color="var(--primary-blue)"/><h4>Огромный выбор</h4></div>
        </div>
      </div>

      {/* STORES SECTION */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-8">Популярные магазины</h2>
        <div className="stores-grid">
          {mockStores.map(store => <StoreCard key={store.id} store={store} />)}
        </div>
      </div>

      {/* BOTTOM CTA BANNER */}
      <div className="container mt-8">
        <div className="bottom-banner">
          <div>
            <h2 style={{color: '#fff', fontSize: '32px'}}>Поручите нашим мастерам оформление заказов</h2>
            <p style={{color: 'rgba(255,255,255,0.8)', marginTop: '12px'}}>Это удобно и экономит ваше время.</p>
            <Button className="mt-8" style={{ background: 'var(--primary-green)' }}>Подробнее</Button>
          </div>
        </div>
      </div>
    </div>
  );
}
END

cat > src/pages/home-page/ui/home-page.css << 'END'
.hero-banner { background: linear-gradient(135deg, #5B52A3, #40B8EA); border-radius: 36px; padding: 60px 80px; color: #fff; display: flex; justify-content: space-between; align-items: center; min-height: 480px; position: relative; overflow: hidden; }
.hero-text { max-width: 550px; z-index: 2; }
.hero-text h1 { font-size: 48px; line-height: 1.1; font-weight: 700; }
.hero-img img { max-width: 450px; height: auto; object-fit: contain; }
.benefits-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; }
.benefit-card { background: #fff; padding: 24px; border-radius: 16px; display: flex; align-items: center; gap: 16px; border: 1px solid var(--border); }
.benefit-card h4 { font-size: 16px; }
.stores-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 24px; }
.bottom-banner { background: linear-gradient(90deg, #5B52A3, #40B8EA); border-radius: 36px; padding: 60px; }
@media (max-width: 992px) { 
  .hero-banner { flex-direction: column; padding: 40px; text-align: center; } 
  .benefits-grid { grid-template-columns: 1fr 1fr; }
  .hero-img img { max-width: 100%; margin-top: 32px; }
}
END
echo "✅ Главная страница собрана!"
