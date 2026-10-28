import { Outlet } from 'react-router-dom';
import { Header } from '@/widgets/header';
import { Footer } from '@/widgets/footer';
import { ToastContainer } from '@/shared/ui/toast';

export const MainLayout = () => (
  <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh' }}>
    <Header />
    <main style={{ flex: 1 }}><Outlet /></main>
    <Footer />
    <ToastContainer />
  </div>
);
