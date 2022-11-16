DROP PACKAGE log_pkg;

CREATE OR REPLACE PACKAGE log_pkg AS
    PROCEDURE saveline (p_fn_name VARCHAR2);
END log_pkg;

CREATE OR REPLACE PACKAGE BODY log_pkg AS
   PROCEDURE putline (p_fn_name VARCHAR2)
   IS
   BEGIN
      INSERT INTO j_exec (fn_name) VALUES (p_fn_name);
   END;

   PROCEDURE saveline (p_fn_name VARCHAR2)
   IS
     PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      putline (p_fn_name);
      COMMIT;
      EXCEPTION WHEN OTHERS THEN ROLLBACK;
   END;
END log_pkg;