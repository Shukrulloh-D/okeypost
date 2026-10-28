export default function PaymentTab() {
  return (
    <div>
      <h3 className="title-h2 mb-8">Реквизиты для оплаты</h3>
      
      <h4 className="font-bold mb-4 text-lg">Privat 24</h4>
      <div style={{marginBottom: 32}}>
        <div style={{display: 'flex', background: '#F8FAFC', padding: '16px', borderRadius: '8px 8px 0 0', borderBottom: '1px solid #fff', fontSize: 14}}><span style={{width: 250, color: 'var(--text-muted)'}}>Номер карточки:</span><span>4442076545992244</span></div>
        <div style={{display: 'flex', background: '#F8FAFC', padding: '16px', borderRadius: '0 0 8px 8px', fontSize: 14}}><span style={{width: 250, color: 'var(--text-muted)'}}>ФИО:</span><span>Jelena Bolkova</span></div>
      </div>

      <h4 className="font-bold mb-4 text-lg">Тинькофф</h4>
      <div style={{marginBottom: 32}}>
        <div style={{display: 'flex', background: '#F8FAFC', padding: '16px', borderRadius: '8px 8px 0 0', borderBottom: '1px solid #fff', fontSize: 14}}><span style={{width: 250, color: 'var(--text-muted)'}}>Номер карточки:</span><span>4442076545992244</span></div>
        <div style={{display: 'flex', background: '#F8FAFC', padding: '16px', borderRadius: '0 0 8px 8px', fontSize: 14}}><span style={{width: 250, color: 'var(--text-muted)'}}>ФИО:</span><span>Jelena Bolkova</span></div>
      </div>

      <h4 className="font-bold mb-4 text-lg">SWIFT</h4>
      <div style={{display: 'flex', flexDirection: 'column', gap: 4}}>
        {[ {l: 'ФИО:', v: 'Mykhaylo Pylypchak'}, {l: 'Адрес проживания:', v: 'Unit 1 Cromwell Industrial Estate, Staffa Road, E10 7QZ, London'}, {l: 'Банк:', v: 'London - Unistream'}, {l: 'Адрес и название отделения банка:', v: 'Westfield Stratford City, E20'}, {l: 'Branch:', v: '40-43-65'}, {l: 'Номер счета (Account number):', v: '60209836'}, {l: 'IBAN:', v: 'GB44HBUK40143445660209836'}, {l: 'SWIFTBIC:', v: 'HBUKGB4B'} ].map((row, i) => (
          <div key={i} style={{display: 'flex', background: '#F8FAFC', padding: '16px 24px', borderRadius: 8, fontSize: 14}}><span style={{width: 250, color: 'var(--text-muted)'}}>{row.l}</span><span>{row.v}</span></div>
        ))}
      </div>
    </div>
  );
}
