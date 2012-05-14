<form method="post" action="<?php echo $_SERVER['REQUEST_URI']; ?>">
	<input type="hidden" name="REQUEST_TOKEN" value="<?php echo REQUEST_TOKEN; ?>" />
	<div class="tl_panel">
		<div class="tl_submit_panel tl_subpanel">
			<input type="image" name="filter" id="filter" src="system/themes/default/images/reload.gif"
				class="tl_img_submit" title="<?php echo $GLOBALS['TL_LANG']['MSC']['apply'] ; ?>" alt="<?php echo $GLOBALS['TL_LANG']['MSC']['apply'] ; ?>">
		</div>
		<div class="tl_search tl_subpanel">
			<strong><?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['year']; ?>:</strong>
			<input type="text" name="appointments_year" class="tl_text" value="<?php echo $this->year; ?>">	
		</div>
		<div class="tl_search tl_subpanel">
			<strong><?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['month']; ?>:</strong>
			<input type="text" name="appointments_month" class="tl_text" value="<?php echo $this->month; ?>">	
		</div>
		<div class="clear"></div>
	</div>
</form>
<div id="tl_buttons">
    <a onclick="Backend.getScrollOffset();" accesskey="n" title="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['new'][1]; ?>"
		class="add_date" href="contao/main.php?do=li_appointments&table=tl_li_appointment&act=create"
		style="background-image: url('system/themes/default/images/new.gif');">
		<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['new'][0]; ?>
    </a>
     &nbsp; :: &nbsp;
    <a onclick="Backend.getScrollOffset();" accesskey="n" title="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['monthView'][1]; ?>"
		class="manage_work_packages" href="contao/main.php?do=li_appointments"
		style="background-image: url('system/modules/li_crm/icons/appointments_month.png');">
        <?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['monthView'][0]; ?>
    </a>
    &nbsp; :: &nbsp;
    <a onclick="Backend.getScrollOffset();" accesskey="n" title="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['weekView'][1]; ?>"
		class="manage_work_packages" href="contao/main.php?do=li_appointments&view=week"
		style="background-image: url('system/modules/li_crm/icons/appointments_week.png');">
        <?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['weekView'][0]; ?>
    </a>
    &nbsp; :: &nbsp;
    <a onclick="Backend.getScrollOffset();" accesskey="n" title="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['dayView'][1]; ?>"
		class="manage_work_packages" href="contao/main.php?do=li_appointments&view=day"
		style="background-image: url('system/modules/li_crm/icons/appointments_day.png');">
        <?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['dayView'][0]; ?>
    </a>
</div>
<div id="month_buttons">
	<a href="contao/main.php?do=li_appointments&appointments_year=<?php echo $this->prevYear; ?>&appointments_month=<?php echo $this->prevMonth; ?>"
	   title="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['prevMonth']; ?>">
		<img src="system/modules/li_crm/icons/arrow_left.png" alt="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['prevMonth']; ?>"/>
	</a>
	<a style="float:right;" href="contao/main.php?do=li_appointments&appointments_year=<?php echo $this->nextYear; ?>&appointments_month=<?php echo $this->nextMonth; ?>"
	   title="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['nextMonth']; ?>">
		<img src="system/modules/li_crm/icons/arrow_right.png" alt="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['nextMonth']; ?>"/>
	</a>
</div>
<div id="appointments_wrapper">
	<table id="appointments">
		<?php foreach($this->days as $day): ?>
		<tr>
			<th><?php echo $day['date']; ?></th>
			<td class="appointments">
				<?php $appointments = $day['appointments']; ?>
				<?php if($appointments != null): ?>
				<?php $counter = 1; ?>
				<?php $countAppointments = count($appointments); ?>
				<?php foreach($appointments as $appointment): ?>
				<div class="appointment<?php echo $counter == 1 ? ' first' : ''; ?><?php echo $counter == $countAppointments ? ' last' : ''; ?>" style="background-color:#<?php echo $appointment['color']; ?>">
					<span class="subject">
						<a href="system/modules/li_crm/DetailsBox.php?table=tl_li_appointment&id=<?php echo $appointment['id']; ?>" title="<?php echo sprintf($GLOBALS['TL_LANG']['tl_li_appointment']['edit'][1], $appointment['id']); ?>" rel="lightbox[610 80%]">
							<?php echo $appointment['subject']; ?>
						</a>
					</span>
					<div class="options">
						<a href="contao/main.php?do=li_appointments&table=tl_li_appointment&act=edit&id=<?php echo $appointment['id']; ?>" title="<?php echo sprintf($GLOBALS['TL_LANG']['tl_li_appointment']['edit'][1], $appointment['id']); ?>">
							<img src="system/modules/li_crm/icons/edit.png" alt="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['edit'][0]; ?>" width="16" height="16">
						</a>
						<a href="contao/main.php?do=li_appointments&table=tl_li_appointment&act=delete&id=<?php echo $appointment['id']; ?>" title="<?php echo sprintf($GLOBALS['TL_LANG']['tl_li_appointment']['delete'][1], $appointment['id']); ?>" onclick="if (!confirm('<?php echo sprintf($GLOBALS['TL_LANG']['MSC']['deleteConfirm'], $appointment['id']); ?>')) return false; Backend.getScrollOffset();" "="">
							<img src="system/modules/li_crm/icons/delete.png" alt="<?php echo $GLOBALS['TL_LANG']['tl_li_appointment']['delete'][0]; ?>" width="16" height="16">
						</a>
					</div>
				</div>
				<?php $counter++; ?>
				<?php endforeach; ?>
				<?php endif; ?>
			</td>
		</tr>
		<?php endforeach; ?>
	</table>
</div>
