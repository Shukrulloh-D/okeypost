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
import { CreateSelfOrderPage } from '@/pages/create-self-order-page';
import { CheckoutPage } from '@/pages/checkout-page';
import { TopUpPage } from '@/pages/top-up-page';
import { EditProfile } from '@/features/edit-profile';
import { ChangePassword } from '@/features/change-password';

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
              { path: 'edit', element: <EditProfile /> },
              { path: 'password', element: <ChangePassword /> },
            ]
          },
          { path: 'orders', element: <OrdersPage /> },
          { path: 'orders/create-self', element: <CreateSelfOrderPage /> },
          { path: 'orders/checkout', element: <CheckoutPage /> },
          { path: 'create-parcel', element: <CreateParcelPage /> },
          { path: 'address-book', element: <AddressBookPage /> },
          { path: 'notifications', element: <NotificationsPage /> },
          { path: 'top-up', element: <TopUpPage /> },
        ]
      }
    ]
  }
]);
