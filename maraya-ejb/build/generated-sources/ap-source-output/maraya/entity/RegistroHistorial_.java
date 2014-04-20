package maraya.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import maraya.entity.Historial;
import maraya.entity.Medicos;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-04-19T02:28:40")
@StaticMetamodel(RegistroHistorial.class)
public class RegistroHistorial_ { 

    public static volatile SingularAttribute<RegistroHistorial, Long> id;
    public static volatile SingularAttribute<RegistroHistorial, Historial> historial;
    public static volatile SingularAttribute<RegistroHistorial, String> contenido;
    public static volatile SingularAttribute<RegistroHistorial, Medicos> medico;
    public static volatile SingularAttribute<RegistroHistorial, Date> fechaCreacion;
    public static volatile SingularAttribute<RegistroHistorial, Date> fechaModificacion;

}