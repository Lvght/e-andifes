CREATE RULE no_delete_audit_log AS ON DELETE TO registro_auditoria DO INSTEAD NOTHING;

CREATE RULE no_update_audit_log AS ON UPDATE TO registro_auditoria DO INSTEAD NOTHING;

REVOKE ALL PRIVILEGES ON TABLE registro_auditoria FROM public;
REVOKE ALL PRIVILEGES ON TABLE registro_auditoria FROM gestor_andifes;

GRANT SELECT ON TABLE registro_auditoria TO public;