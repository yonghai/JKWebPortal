package jk.o1office.ddh.timer;


/**
 * 无用类
 */
public class SequenceResetJob {
	private OrderFactoryBean orderFactoryBean;
	public OrderFactoryBean getOrderFactoryBean() {
		return orderFactoryBean;
	}
	public void setOrderFactoryBean(OrderFactoryBean orderFactoryBean) {
		this.orderFactoryBean = orderFactoryBean;
	}
	
	public void execute() {
		System.out.println("reset....");
		orderFactoryBean.reset();
	}
}

/*
 <bean id="sequence" class="bean.SequenceFactoryBean" />

<bean id="job" class="job.SequenceResetJob" />

<bean id="jobDetail"
	class="org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean">
	<property name="targetObject" ref="job" />
	<property name="targetMethod" value="execute" />
</bean>

<bean id="cronTrigger" class="org.springframework.scheduling.quartz.CronTriggerBean">
	<property name="jobDetail" ref="jobDetail" />
	<property name="cronExpression" value="0 0 0 * * ?" />
</bean>

<bean name="quartzScheduler"
	class="org.springframework.scheduling.quartz.SchedulerFactoryBean">
	<property name="triggers">
		<list>
			<ref bean="cronTrigger" />
		</list>
	</property>
</bean>
*/