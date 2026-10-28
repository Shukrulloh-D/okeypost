export default function InfoTab() {
  return (
    <div>
      <h3 className="mb-4">Информация о работе</h3>
      <div style={{ display: 'grid', gap: '8px' }}>
        <div style={{ display: 'flex', background: '#F5F7FA', padding: '12px 16px', borderRadius: 8, fontSize: 14 }}><span style={{ width: 200, color: 'var(--text-muted)' }}>Номер телефона:</span><span>+44 20 7946 0958</span></div>
        <div style={{ display: 'flex', background: '#F5F7FA', padding: '12px 16px', borderRadius: 8, fontSize: 14 }}><span style={{ width: 200, color: 'var(--text-muted)' }}>E-mail:</span><span>dmitro.karlov@gmail.com</span></div>
      </div>
    </div>
  );
}
