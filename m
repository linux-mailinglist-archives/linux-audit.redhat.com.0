Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C72991FA1B
	for <lists+linux-audit@lfdr.de>; Wed, 15 May 2019 20:40:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A7A788E62;
	Wed, 15 May 2019 18:40:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9ECA10013D9;
	Wed, 15 May 2019 18:40:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 839C45B424;
	Wed, 15 May 2019 18:39:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FIdFAQ018312 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 14:39:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 110E6179A2; Wed, 15 May 2019 18:39:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-121-255.rdu2.redhat.com [10.10.121.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39B09600C4;
	Wed, 15 May 2019 18:39:09 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghau90 v2] sig_info: use standard template for log messages
Date: Wed, 15 May 2019 14:39:10 -0400
Message-ID: <1595337.P9fJRm54gO@x2>
Organization: Red Hat
In-Reply-To: <1557505317-11714-1-git-send-email-rgb@redhat.com>
References: <1557505317-11714-1-git-send-email-rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 15 May 2019 18:40:09 +0000 (UTC)

On Friday, May 10, 2019 12:21:57 PM EDT Richard Guy Briggs wrote:
> Records that are triggered by an AUDIT_SIGNAL_INFO message including
> AUDIT_DAEMON_CONFIG (HUP), AUDIT_DAEMON_ROTATE (USR1),
> AUDIT_DAEMON_RESUME (USR2) and AUDIT_DAEMON_END (TERM) have inconsistent
> reporting of signal info and swinging field "state".
> 
> They also assume that an empty security context implies there is no
> other useful information in the AUDIT_SIGNAL_INFO message so don't use
> the information that is there.
> 
> Normalize AUDIT_DAEMON_CONFIG to use the value "reconfigure" and add the
> "state" field where missing.
> 
> Use audit_sig_info values when available, not making assumptions about
> their availability when the security context is absent.
> 
> See: https://github.com/linux-audit/audit-userspace/issues/90

This was applied with some fixes. I don't know why ':' was introduced in one 
event. But we've been trying to get rid of non-meaningful text. Also, there 
were 2 places where a success result was switched to a fail. These were fixed 
back.

-Steve

> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Changelog:
> v2:
> - omit subj= if selinux unavailable
> - add missing colon to daemon_config
> 
>  docs/audit_request_signal_info.3 |  2 +-
>  lib/libaudit.c                   | 12 +++++++++
>  lib/libaudit.h                   |  1 +
>  src/auditd-event.c               |  2 +-
>  src/auditd-reconfig.c            |  9 +++----
>  src/auditd.c                     | 56
> ++++++++++++++-------------------------- 6 files changed, 38
> insertions(+), 44 deletions(-)
> 
> diff --git a/docs/audit_request_signal_info.3
> b/docs/audit_request_signal_info.3 index 873deb58bef3..b68d7bbefeed 100644
> --- a/docs/audit_request_signal_info.3
> +++ b/docs/audit_request_signal_info.3
> @@ -8,7 +8,7 @@ int audit_request_signal_info(int fd);
> 
>  .SH "DESCRIPTION"
> 
> -audit_request_signal_info requests that the kernel send information about
> the sender of a signal to the audit daemon. The sinal info structure is as
> follows: +audit_request_signal_info requests that the kernel send
> information about the sender of a signal to the audit daemon. The signal
> info structure is as follows:
> 
>  .nf
>  struct audit_sig_info {
> diff --git a/lib/libaudit.c b/lib/libaudit.c
> index 2af017a0e520..e695791f9243 100644
> --- a/lib/libaudit.c
> +++ b/lib/libaudit.c
> @@ -674,6 +674,18 @@ int audit_request_signal_info(int fd)
>  	return rc;
>  }
> 
> +char *audit_format_signal_info(char *buf, int len, char *op, struct
> audit_reply *rep, char *res) +{
> +	if (rep->len == 24)
> +		snprintf(buf, len, "op=%s auid=%u pid=%d res=%s", op,
> +		 	rep->signal_info->uid, rep->signal_info->pid, res);
> +	else
> +		snprintf(buf, len, "op=%s auid=%u pid=%d subj=%s res=%s",
> +		 	op, rep->signal_info->uid, rep->signal_info->pid,
> +		 	rep->signal_info->ctx, res);
> +	return buf;
> +}
> +
>  int audit_update_watch_perms(struct audit_rule_data *rule, int perms)
>  {
>  	unsigned int i, done=0;
> diff --git a/lib/libaudit.h b/lib/libaudit.h
> index 77e4142beea2..36ea8bc04e8a 100644
> --- a/lib/libaudit.h
> +++ b/lib/libaudit.h
> @@ -573,6 +573,7 @@ extern int  audit_setloginuid(uid_t uid);
>  extern uint32_t audit_get_session(void);
>  extern int  audit_detect_machine(void);
>  extern int audit_determine_machine(const char *arch);
> +extern char *audit_format_signal_info(char *buf, int len, char *op, struct
> audit_reply *rep, char *res);
> 
>  /* Translation functions */
>  extern int        audit_name_to_field(const char *field);
> diff --git a/src/auditd-event.c b/src/auditd-event.c
> index ef2828d8df94..2970aba44456 100644
> --- a/src/auditd-event.c
> +++ b/src/auditd-event.c
> @@ -1572,7 +1572,7 @@ static void reconfigure(struct auditd_event *e)
> 
>  	e->reply.type = AUDIT_DAEMON_CONFIG;
>  	e->reply.len = snprintf(e->reply.msg.data, 
MAX_AUDIT_MESSAGE_LENGTH-2,
> -	"%s op=reconfigure state=changed auid=%u pid=%d subj=%s res=success",
> +	"%s : op=reconfigure state=changed auid=%u pid=%d subj=%s res=success",
>  		date, uid, pid, ctx );
>  	e->reply.message = e->reply.msg.data;
>  	free((char *)ctx);
> diff --git a/src/auditd-reconfig.c b/src/auditd-reconfig.c
> index a03e29aa57ab..f5b00e6d1dc7 100644
> --- a/src/auditd-reconfig.c
> +++ b/src/auditd-reconfig.c
> @@ -115,12 +115,9 @@ static void *config_thread_main(void *arg)
>  	} else {
>  		// need to send a failed event message
>  		char txt[MAX_AUDIT_MESSAGE_LENGTH];
> -		snprintf(txt, sizeof(txt),
> -	    "op=reconfigure state=no-change auid=%u pid=%d subj=%s 
res=failed",
> -			e->reply.signal_info->uid,
> -			e->reply.signal_info->pid,
> -			(e->reply.len > 24) ?
> -				e->reply.signal_info->ctx : "?");
> +		audit_format_signal_info(txt, sizeof(txt),
> +					 "reconfigure state=no-change",
> +				         &e->reply, "failed");
>  		// FIXME: need to figure out sending this
>  		//send_audit_event(AUDIT_DAEMON_CONFIG, txt);
>  		free_config(&new_config);
> diff --git a/src/auditd.c b/src/auditd.c
> index c04a1c9ce93f..63404b25fbc5 100644
> --- a/src/auditd.c
> +++ b/src/auditd.c
> @@ -131,7 +131,7 @@ static void hup_handler( struct ev_loop *loop, struct
> ev_signal *sig, int revent rc = audit_request_signal_info(fd);
>  	if (rc < 0)
>  		send_audit_event(AUDIT_DAEMON_CONFIG,
> -	  "op=hup-info state=request-siginfo auid=-1 pid=-1 subj=? 
res=failed");
> +	  "op=reconfigure state=no-change auid=-1 pid=-1 subj=? res=failed");
>  	else
>  		hup_info_requested = 1;
>  }
> @@ -147,7 +147,7 @@ static void user1_handler(struct ev_loop *loop, struct
> ev_signal *sig, rc = audit_request_signal_info(fd);
>  	if (rc < 0)
>  		send_audit_event(AUDIT_DAEMON_ROTATE,
> -			 "op=usr1-info auid=-1 pid=-1 subj=? res=failed");
> +			 "op=rotate-logs auid=-1 pid=-1 subj=? res=failed");
>  	else
>  		usr1_info_requested = 1;
>  }
> @@ -163,7 +163,7 @@ static void user2_handler( struct ev_loop *loop, struct
> ev_signal *sig, int reve if (rc < 0) {
>  		resume_logging();
>  		send_audit_event(AUDIT_DAEMON_RESUME,
> -			 "op=resume-logging auid=-1 pid=-1 subj=? 
res=success");
> +			 "op=resume-logging auid=-1 pid=-1 subj=? res=failed");
>  	} else
>  		usr2_info_requested = 1;
>  }
> @@ -515,45 +515,33 @@ static void netlink_handler(struct ev_loop *loop,
> struct ev_io *io, break;
>  		case AUDIT_SIGNAL_INFO:
>  			if (hup_info_requested) {
> +				char hup[MAX_AUDIT_MESSAGE_LENGTH];
>  				audit_msg(LOG_DEBUG,
>  				    "HUP detected, starting config manager");
>  				reconfig_ev = cur_event;
>  				if (start_config_manager(cur_event)) {
> -					send_audit_event(
> -						AUDIT_DAEMON_CONFIG,
> -				  "op=reconfigure state=no-change "
> -				  "auid=-1 pid=-1 subj=? res=failed");
> +					audit_format_signal_info(hup, sizeof(hup),
> +								 "reconfigure 
state=no-change",
> +								 &cur_event->reply,
> +								 "failed");
> +					send_audit_event(AUDIT_DAEMON_CONFIG, 
hup);
>  				}
>  				cur_event = NULL;
>  				hup_info_requested = 0;
>  			} else if (usr1_info_requested) {
>  				char usr1[MAX_AUDIT_MESSAGE_LENGTH];
> -				if (cur_event->reply.len == 24) {
> -					snprintf(usr1, sizeof(usr1),
> -					"op=rotate-logs auid=-1 pid=-1 subj=?");
> -				} else {
> -					snprintf(usr1, sizeof(usr1),
> -				 "op=rotate-logs auid=%u pid=%d subj=%s",
> -					 cur_event->reply.signal_info->uid,
> -					 cur_event->reply.signal_info->pid,
> -					 cur_event->reply.signal_info->ctx);
> -				}
> +				audit_format_signal_info(usr1, sizeof(usr1),
> +							 "rotate-logs",
> +							 &cur_event->reply,
> +							 "success");
>  				send_audit_event(AUDIT_DAEMON_ROTATE, usr1);
>  				usr1_info_requested = 0;
>  			} else if (usr2_info_requested) {
>  				char usr2[MAX_AUDIT_MESSAGE_LENGTH];
> -				if (cur_event->reply.len == 24) {
> -					snprintf(usr2, sizeof(usr2),
> -						"op=resume-logging auid=-1 "
> -						"pid=-1 subj=? res=success");
> -				} else {
> -					snprintf(usr2, sizeof(usr2),
> -						"op=resume-logging "
> -					"auid=%u pid=%d subj=%s res=success",
> -					 cur_event->reply.signal_info->uid,
> -					 cur_event->reply.signal_info->pid,
> -					 cur_event->reply.signal_info->ctx);
> -				}
> +				audit_format_signal_info(usr2, sizeof(usr2),
> +							 "resume-logging",
> +							 &cur_event->reply,
> +							 "success");
>  				resume_logging();
>  				libdisp_resume();
>  				send_audit_event(AUDIT_DAEMON_RESUME, usr2);
> @@ -993,18 +981,14 @@ int main(int argc, char *argv[])
>  		rc = get_reply(fd, &trep, rc);
>  		if (rc > 0) {
>  			char txt[MAX_AUDIT_MESSAGE_LENGTH];
> -			snprintf(txt, sizeof(txt),
> -				"op=terminate auid=%u "
> -				"pid=%d subj=%s res=success",
> -				 trep.signal_info->uid,
> -				 trep.signal_info->pid,
> -				 trep.signal_info->ctx);
> +			audit_format_signal_info(txt, sizeof(txt), "terminate",
> +						 &trep, "success");
>  			send_audit_event(AUDIT_DAEMON_END, txt);
>  		}
>  	}
>  	if (rc <= 0)
>  		send_audit_event(AUDIT_DAEMON_END,
> -			"op=terminate auid=-1 pid=-1 subj=? res=success");
> +			"op=terminate auid=-1 pid=-1 subj=? res=failed");
>  	free(cur_event);
> 
>  	// Tear down IO watchers Part 2




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
