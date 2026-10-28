#!/bin/bash
echo "🛠️ Создаем недостающие страницы и чиним роутер..."

# 1. Создаем страницу Калькулятора (если потерялась)
mkdir -p src/pages/calculator-page/ui
cat > src/pages/calculator-page/ui/calculator-page.jsx << 'END'
import { DeliveryCalculator } from '@/features/delivery-calculator';
export default function CalculatorPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Калькулятор доставки</h1>
      <DeliveryCalculator />
    </div>
  );
}
END
echo "export { default as CalculatorPage } from './ui/calculator-page';" > src/pages/calculator-page/index.js

# 2. Создаем страницу Цен (Figma Screen 04)
mkdir -p src/pages/prices-page/ui
cat > src/pages/prices-page/ui/prices-page.jsx << 'END'
export default function PricesPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Услуги доставки из Великобритании</h1>
      <p className="text-muted mb-8">Друг, тут ты верстаешь карточки услуг и калькулятор по макету.</p>
      {/* Друг потом вставит сюда красивый компонент калькулятора */}
    </div>
  );
}
END
echo "export { default as PricesPage } from './ui/prices-page';" > src/pages/prices-page/index.js

# 3. Создаем страницу Магазинов (Figma Screen 08)
mkdir -p src/pages/stores-page/ui
cat > src/pages/stores-page/ui/stores-page.jsx << 'END'
import { StoreCard } from '@/entities/store-card';
import { mockStores } from '@/shared/mock/data';

export default function StoresPage() {
  return (
    <div className="container page-wrapper">
      <h1 className="title-h1 mb-8">Популярные магазины</h1>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))', gap: '20px' }}>
        {mockStores.map(store => <StoreCard key={store.id} store={store} />)}
      </div>
    </div>
  );
}
END
echo "export { default as StoresPage } from './ui/stores-page';" > src/pages/stores-page/index.js

# 4. Создаем страницу Партнерам (Figma Screen 06)
mkdir -p src/pages/partnership-page/ui
cat > src/pages/partnership-page/ui/partnership-page.jsx << 'END'
export default function PartnershipPage() {
  return (
    <div className="container page-wrapper text-center">
      <h1 className="title-h1 mb-8">Бонусы и партнерская программа</h1>
      <p className="text-muted">Друг, сверстай этот блок по макету.</p>
    </div>
  );
}
END
echo "export { default as PartnershipPage } from './ui/partnership-page';" > src/pages/partnership-page/index.js

# 5. ПЕРЕЗАПИСЫВАЕМ РОУТЕР (Синхронизируем импорты с реальностью)
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
import { CalculatorPage } from '@/pages/calculator-page';
import { PricesPage } from '@/pages/prices-page';
import { StoresPage } from '@/pages/stores-page';
import { PartnershipPage } from '@/pages/partnership-page';
import { HowToBuyPage } from '@/pages/how-to-buy-page';
import { SalesPage } from '@/pages/sales-page';
import { BlogPage } from '@/pages/blog-page';
import { AddressTab } from '@/pages/profile-page/ui/address-tab';
import { EditTab } from '@/pages/profile-page/ui/edit-tab';
import { PasswordTab } from '@/pages/profile-page/ui/password-tab';
import { RequisitesTab } from '@/pages/profile-page/ui/requisites-tab';

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
      { path: 'blog', element: <BlogPage /> },
      { path: 'faq', element: <FaqPage /> },
      { path: 'calculator', element: <CalculatorPage /> },
      { path: 'prices', element: <PricesPage /> },
      { path: 'stores', element: <StoresPage /> },
      { path: 'partnership', element: <PartnershipPage /> },
      {
        element: <ProtectedRoute />,
        children: [
          {
            path: 'profile',
            element: <ProfilePage />,
            children: [
              { index: true, element: <AddressTab /> },
              { path: 'address', element: <AddressTab /> },
              { path: 'edit', element: <EditTab /> },
              { path: 'password', element: <PasswordTab /> },
              { path: 'requisites', element: <RequisitesTab /> },
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

echo "✅ Все страницы созданы! Роутер синхронизирован."
