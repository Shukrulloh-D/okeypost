import { useForm } from 'react-hook-form';
import { useState } from 'react';
import { Button } from '@/shared/ui/button';
import { Input } from '@/shared/ui/input';
import { SuccessModal } from '@/shared/ui/success-modal';

export default function CreateSelfOrderPage() {
  const [showSuccess, setShowSuccess] = useState(false);
  const { register, handleSubmit } = useForm();
  return (
    <>
      <div>
        <h2 className="title-h2 mb-8">Создание заказа, который Вы выполняете самостоятельно</h2>
        <form onSubmit={handleSubmit(() => setShowSuccess(true))} className="card">
          <div className="grid-3">
            <Input label="Трек-номер*" register={register('track', { required: true })} placeholder="UK123456" />
            <Input label="Сумма заказа, £*" type="number" register={register('amount', { required: true })} placeholder="Введите сумму" />
            <Input label="Магазин*" register={register('shop', { required: true })} placeholder="Введите магазин" />
          </div>
          <Button type="submit" className="mt-6">Сохранить</Button>
        </form>
      </div>
      <SuccessModal isOpen={showSuccess} onClose={() => setShowSuccess(false)} title="Заказ добавлен!" message="Теперь он отображается в вашем списке заказов." />
    </>
  );
}
