package maraya.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import maraya.entity.Paciente;
import maraya.entity.RegistroHistorial;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-04-19T02:28:40")
@StaticMetamodel(Historial.class)
public class Historial_ { 

    public static volatile SingularAttribute<Historial, Long> id;
    public static volatile SingularAttribute<Historial, String> nHistorial;
    public static volatile CollectionAttribute<Historial, RegistroHistorial> registroHistorialCollection;
    public static volatile SingularAttribute<Historial, String> informacion;
    public static volatile SingularAttribute<Historial, Date> fechaCreacion;
    public static volatile CollectionAttribute<Historial, Paciente> pacienteCollection;

}