#!/bin/bash
echo "👤 Улучшаем Профиль и создаем заглушки..."

# 1. Обновляем страницу Профиля (добавляем верхнюю панель)
cat > src/pages/profile-page/ui/profile-page.jsx << 'END'
import { Outlet, useNavigate } from 'react-router-dom';
import { ProfileSidebar } from '@/widgets/profile-sidebar';
import { useAuthStore } from '@/shared/store/auth-store';
import { Button } from '@/shared/ui/button';
import { Wallet, User, Clock } from 'lucide-react';
import './profile-page.css';

export default function ProfilePage() {
  const { logout, user } = useAuthStore();
  const navigate = useNavigate();

  return (
    <div className="container page-wrapper">
      {/* Верхняя синяя плашка как на скрине Figma */}
      <div className="profile-top-bar">
        <div className="top-bar-info">
          <div className="info-item"><Clock size={16} /> Пн-Пт: 09:00-18:00</div>
          <div className="info-item"><User size={16} /> {user?.name || 'Пользователь'}</div>
        </div>
        <div className="top-bar-balance">
          <div>Баланс: 0.0 ₽</div>
          <Button style={{ background: 'var(--primary-green)', padding: '8px 16px', fontSize: '12px' }}>Пополнить</Button>
        </div>
      </div>

      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '24px', marginTop: '24px' }}>
        <h1 className="title-h1">Личный кабинет</h1>
        <Button variant="outline" onClick={() => { logout(); navigate('/'); }}>Выйти</Button>
      </div>

      <div className="profile-layout">
        <ProfileSidebar />
        <div className="profile-content">
          <Outlet />
        </div>
      </div>
    </div>
  );
}
END

cat > src/pages/profile-page/ui/profile-page.css << 'END'
.profile-top-bar { background: linear-gradient(90deg, #5B52A3, #40B8EA); border-radius: 16px; padding: 16px 24px; color: #fff; display: flex; justify-content: space-between; align-items: center; }
.top-bar-info { display: flex; gap: 24px; font-size: 14px; }
.info-item { display: flex; align-items: center; gap: 8px; }
.top-bar-balance { display: flex; align-items: center; gap: 16px; font-weight: 600; }
.profile-layout { display: flex; gap: 24px; }
.profile-content { flex: 1; background: #fff; padding: 32px; border-radius: 16px; min-height: 400px; border: 1px solid var(--border); }
@media (max-width: 768px) { .profile-layout { flex-direction: column; } .profile-top-bar { flex-direction: column; gap: 16px; align-items: flex-start; } }
END

# 2. Создаем красивые заглушки для друга (3 страницы)
# Твой друг просто заменит текст на верстку из Figma

cat > src/pages/how-to-buy-page/ui/how-to-buy-page.jsx << 'END'
export default function HowToBuyPage() {
  return (
    <div className="container page-wrapper text-center">
      <h1 className="title-h1 mb-8">Как покупать</h1>
      <div style={{ background: '#fff', padding: '60px', borderRadius: '24px', border: '2px dashed var(--primary-blue)' }}>
        <h2 style={{ color: 'var(--primary-blue)' }}>Территория друга (Верстка)</h2>
        <p className="text-muted mt-4">Сюда нужно вставить верстку страницы "Как покупать" по макету Figma.</p>
      </div>
    </div>
  );
}
END

cat > src/pages/sales-page/ui/sales-page.jsx << 'END'
export default function SalesPage() {
  return (
    <div className="container page-wrapper text-center">
      <h1 className="title-h1 mb-8">Распродажи</h1>
      <div style={{ background: '#fff', padding: '60px', borderRadius: '24px', border: '2px dashed var(--primary-blue)' }}>
        <h2 style={{ color: 'var(--primary-blue)' }}>Территория друга (Верстка)</h2>
        <p className="text-muted mt-4">Сюда нужно вставить верстку страницы "Распродажи" по макету Figma.</p>
      </div>
    </div>
  );
}
END

cat > src/pages/blog-page/ui/blog-page.jsx << 'END'
export default function BlogPage() {
  return (
    <div className="container page-wrapper text-center">
      <h1 className="title-h1 mb-8">Блог</h1>
      <div style={{ background: '#fff', padding: '60px', borderRadius: '24px', border: '2px dashed var(--primary-blue)' }}>
        <h2 style={{ color: 'var(--primary-blue)' }}>Территория друга (Верстка)</h2>
        <p className="text-muted mt-4">Сюда нужно вставить верстку страницы "Блог" по макету Figma.</p>
      </div>
    </div>
  );
}
END

# 3. Остальные страницы (Цены, Магазины, FAQ) - тоже делаем красивые заглушки
cat > src/pages/prices-page/ui/prices-page.jsx << 'END'
export default function PricesPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Цены</h1>
      <div style={{ background: '#fff', padding: '40px', borderRadius: '24px' }}>
         <h2 className="mb-4">Онлайн-калькулятор стоимости доставки</h2>
         <p className="text-muted">Тут будет компонент калькулятора из папки features.</p>
      </div>
    </div>
  );
}
END

cat > src/pages/stores-page/ui/stores-page.jsx << 'END'
import { StoreCard } from '@/entities/store-card';
import { mockStores } from '@/shared/mock/data';

export default function StoresPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Популярные магазины</h1>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))', gap: '24px' }}>
        {/* Дублируем данные, чтобы заполнить сетку */}
        {[...mockStores, ...mockStores, ...mockStores].map((store, index) => (
          <StoreCard key={`${store.id}-${index}`} store={store} />
        ))}
      </div>
    </div>
  );
}
END

echo "✅ Профиль улучшен, заглушки для друга созданы!"
