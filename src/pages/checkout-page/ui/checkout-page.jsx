import { useForm } from 'react-hook-form';
import { useState } from 'react';
import { Button } from '@/shared/ui/button';
import { Input } from '@/shared/ui/input';
import { Plus, Upload, Save } from 'lucide-react';
import { SuccessModal } from '@/shared/ui/success-modal';

export default function CheckoutPage() {
  const [showSuccess, setShowSuccess] = useState(false);
  const { register, handleSubmit } = useForm();
  return (
    <>
      <div>
        <h2 className="title-h2 mb-8">Оформление заказа</h2>
        <form onSubmit={handleSubmit(() => setShowSuccess(true))} className="card">
          <h3 className="text-lg font-bold mb-4">Товар #1</h3>
          <Input label="Ссылка на страницу с товаром*" register={register('url', { required: true })} placeholder="https://..." />
          <Input label="Название товара*" register={register('name', { required: true })} placeholder="Введите название" />
          <div className="grid-2 mt-4">
            <Input label="Количество*" type="number" register={register('qty')} placeholder="1" />
            <Input label="Размер" register={register('size')} placeholder="M / L / XL" />
          </div>
          <div className="grid-2 mt-4">
            <Input label="Цвет" register={register('color')} placeholder="Красный" />
            <Input label="Цена на сайте*" type="number" register={register('price')} placeholder="£" />
          </div>
          <div className="input-group mt-4"><label>Комментарии</label><textarea rows="3" {...register('comment')} placeholder="Любые пожелания к заказу..."></textarea></div>
          <div className="flex gap-3 mt-8">
            <Button type="submit">Отправить</Button>
            <button type="button" className="btn btn-outline"><Plus size={16}/> Добавить товар</button>
            <button type="button" className="btn btn-outline"><Upload size={16}/> Загрузить чек</button>
            <button type="button" className="btn btn-outline"><Save size={16}/> Сохранить</button>
          </div>
        </form>
      </div>
      <SuccessModal isOpen={showSuccess} onClose={() => setShowSuccess(false)} title="Заказ оформлен!" message="Мы свяжемся с вами для подтверждения." />
    </>
  );
}
