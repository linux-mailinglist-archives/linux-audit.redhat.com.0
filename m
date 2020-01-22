Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE3F145EB6
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 23:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579732853;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MUwpfwAovfOOTHEhCayo1foMb13OCane/m+YsYPRkkQ=;
	b=gFkGPy9xLWbP1oA0Tc/8o0SQNZRVfxSMjRc1Vm1xir7DYlQo/s7CxS5iS14hd+XFe1SRgW
	SgN85gOWIgeFpYPg21hZura8783qzmhrKo+L+c1Jh1Piu+im+cwL/g7mUQaz6nw9PNEpRU
	DNd7GNjZAyDcJT1QQXgf7C0+zsoXGsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-iDEbVm_vOw-0LG6UbC636g-1; Wed, 22 Jan 2020 17:40:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BE351882CC0;
	Wed, 22 Jan 2020 22:40:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 171F7A4B60;
	Wed, 22 Jan 2020 22:40:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F9B31809567;
	Wed, 22 Jan 2020 22:40:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MMeRtZ007708 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 17:40:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C1CF5109E734; Wed, 22 Jan 2020 22:40:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0C7109E733
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 22:40:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD99E85A33B
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 22:40:25 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-429-iLtMlTwbMECqUPy3VR4IyQ-1; Wed, 22 Jan 2020 17:40:23 -0500
Received: by mail-lf1-f67.google.com with SMTP id 9so825283lfq.10
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 14:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cFI2KS3YTe8YnCNUCd4DQaJDpcrlKps9GUI04jPWB2g=;
	b=ijgl5U8LoluclfcjdbZ5Dd0DfaQA++VJQazIxS969fjCF0cp02/o+uwT/gUJ2vRYy+
	SwGISOE06imoSdYQgM4ax0895XlmFU52fKNu5qxI8a3U+/jacMI8dxs3h8lhPbvFkaIn
	i++0Ine1ykMufM3p9C3Y2FAG9MY4LFYE0jqh5UdSLQjOmydR/FY9K4MIbXxDwvu0gAiy
	16LKJ8UZScCIjC6Qk/qa+Vu9K8xWsqLUZQ/5xrYxZOM9HmteI0p1gTcDmmVHHrm0a6Ba
	thLOJzyMAAcKQ1svdZSgcdwtCZOk6rFTDdp1C6lxKAaTqeucTBcK4trQ1WckOKP/Kuva
	gDLA==
X-Gm-Message-State: APjAAAUrPG/ce47Y9+Nb5AoeX2nH1WcLARXCInL0chtG/Tvhioonam37
	XGgYm6Fz0n9yJd1bVbuCIB1G17xIytoY1WY3dt0m
X-Google-Smtp-Source: APXvYqyexK+Tm0pUv/Rts6z5RtpWCOoQZNqh1gBcQARMjG6p1JR3DHk+wKmOp+F3fMZEQ2xOa8PN30ml9t6FPOELb6c=
X-Received: by 2002:a05:6512:3ac:: with SMTP id
	v12mr3007208lfp.205.1579732822163; 
	Wed, 22 Jan 2020 14:40:22 -0800 (PST)
MIME-Version: 1.0
References: <ca70ee17d85860aa599e0001a75d639d819de7ae.1579292286.git.rgb@redhat.com>
In-Reply-To: <ca70ee17d85860aa599e0001a75d639d819de7ae.1579292286.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jan 2020 17:40:10 -0500
Message-ID: <CAHC9VhR9p+aOTzv7g-ujuMsMtLvOZKkoKJWsthZnj38rzJe1TA@mail.gmail.com>
Subject: Re: [PATCH ghak28 V4] audit: log audit netlink multicast bind and
	unbind events
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: iLtMlTwbMECqUPy3VR4IyQ-1
X-MC-Unique: iDEbVm_vOw-0LG6UbC636g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MMeRtZ007708
X-loop: linux-audit@redhat.com
Cc: nhorman@redhat.com, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	Eric Paris <eparis@parisplace.org>
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 17, 2020 at 3:21 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Log information about programs connecting to and disconnecting from the
> audit netlink multicast socket. This is needed so that during
> investigations a security officer can tell who or what had access to the
> audit trail.  This helps to meet the FAU_SAR.2 requirement for Common
> Criteria.  Here is the systemd startup event:
>
> type=UNKNOWN[1335] msg=audit(2020-01-17 10:30:33.731:6) : pid=1 uid=root auid=unset tty=(none) ses=unset subj=kernel comm=systemd exe=/usr/lib/systemd/systemd nl-mcgrp=1 op=connect res=yes
>
> And the events from the test suite:
>
> type=PROCTITLE msg=audit(2020-01-17 10:36:24.050:294) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> type=SOCKADDR msg=audit(2020-01-17 10:36:24.050:294) : saddr={ saddr_fam=netlink nlnk-fam=16 nlnk-pid=0 }
> type=SYSCALL msg=audit(2020-01-17 10:36:24.050:294) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x7 a1=0x55d65cb79090 a2=0xc a3=0x0 items=0 ppid=671 pid=674 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=3 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.050:294) : pid=674 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=connect res=yes
>
> type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.051:295) : pid=674 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
>
> Please see the upstream issue tracker:
>   https://github.com/linux-audit/audit-kernel/issues/28
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Multicast-Socket-Join-Part
>   https://github.com/rgbriggs/audit-testsuite/compare/ghak28-mcast-part-join
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
>
> ---
> Note: msg type 1334 was skipped due to BPF accepted in another tree.
> Note: v5 due to previous 2014-10-07, 2015-07-23, 2016-11-30, 2017-10-13
> Note: subj attrs included due to missing syscall record for systemd (audit=1)
> Note: tried refactor of subj attrs, but this is yet another new order.
> ---
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 48 ++++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index 3ad935527177..67fb24472dc2 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -116,6 +116,7 @@
>  #define AUDIT_FANOTIFY         1331    /* Fanotify access decision */
>  #define AUDIT_TIME_INJOFFSET   1332    /* Timekeeping offset injected */
>  #define AUDIT_TIME_ADJNTPVAL   1333    /* NTP value adjustment */
> +#define AUDIT_EVENT_LISTENER   1335    /* Task joined multicast read socket */
>
>  #define AUDIT_AVC              1400    /* SE Linux avc denial or grant */
>  #define AUDIT_SELINUX_ERR      1401    /* Internal SE Linux Errors */
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 17b0d523afb3..478259f3fa53 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1520,20 +1520,60 @@ static void audit_receive(struct sk_buff  *skb)
>         audit_ctl_unlock();
>  }
>
> +/* Log information about who is connecting to the audit multicast socket */
> +static void audit_log_multicast_bind(int group, const char *op, int err)
> +{
> +       const struct cred *cred;
> +       struct tty_struct *tty;
> +       char comm[sizeof(current->comm)];
> +       struct audit_buffer *ab;
> +
> +       if (!audit_enabled)
> +               return;
> +
> +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_EVENT_LISTENER);
> +       if (!ab)
> +               return;
> +
> +       cred = current_cred();
> +       tty = audit_get_tty();
> +       audit_log_format(ab, "pid=%u uid=%u auid=%u tty=%s ses=%u",
> +                        task_pid_nr(current),
> +                        from_kuid(&init_user_ns, cred->uid),
> +                        from_kuid(&init_user_ns, audit_get_loginuid(current)),
> +                        tty ? tty_name(tty) : "(none)",
> +                        audit_get_sessionid(current));

Don't we already get all of that information as part of the syscall record?

> +       audit_put_tty(tty);
> +       audit_log_task_context(ab); /* subj= */

Also part of the syscall record.

> +       audit_log_format(ab, " comm=");
> +       audit_log_untrustedstring(ab, get_task_comm(comm, current));

Again.

> +       audit_log_d_path_exe(ab, current->mm); /* exe= */

Again.

> +       audit_log_format(ab, " nl-mcgrp=%d op=%s res=%d", group, op, !err);

This part is new ;)

> +       audit_log_end(ab);
> +}

I'm pretty sure these are the same arguments I made when Steve posted
a prior version of this patch.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

