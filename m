Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 65D921AE77A
	for <lists+linux-audit@lfdr.de>; Fri, 17 Apr 2020 23:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587158383;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yrC2MaZP1E8UoF1zgmFHit2eQYv3GfXqT7OsXUc/Vmo=;
	b=dtUbGurBHQ0IxA95ZjK1hMcf7lMT+UZVvLL1MrmuPcfvv2MV/rdJ690CpdYuxjALugZ8MR
	pzGMY73h70c7xFkjFbNDaKN6xoxXaGld+nJcevu6TxGTmwv1fbxTlIQRtUNnYbUfwFY87n
	OrcKv6eCTmFl4QR6J4+T9YQ0bIm3pNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-HYE0W4vjNtG2jJwas8rxhQ-1; Fri, 17 Apr 2020 17:19:41 -0400
X-MC-Unique: HYE0W4vjNtG2jJwas8rxhQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EAB98017F6;
	Fri, 17 Apr 2020 21:19:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7A0511A028;
	Fri, 17 Apr 2020 21:19:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 894CD9339D;
	Fri, 17 Apr 2020 21:19:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HLJELj001805 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 17:19:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8BF322166B28; Fri, 17 Apr 2020 21:19:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87AAD2166B2F
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 21:19:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 887B58007DB
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 21:19:11 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-259-LFICL4DaMsmRlQ_UPCAhtQ-1; Fri, 17 Apr 2020 17:19:08 -0400
X-MC-Unique: LFICL4DaMsmRlQ_UPCAhtQ-1
Received: by mail-ej1-f65.google.com with SMTP id a2so2617595ejx.5
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 14:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CMi3udRNC1mfaNq6yT5DycC/95qeHzXCYjO0TexCTBg=;
	b=Wf6kq2pog7LBPvnpl8bf7SxFNZ7Es/GNUjPdxzgcHwsrP6EXw6aWkhashq54nkhKZX
	u4WkLvIqmDvcEplnpgbAG+KiEJ5w35P+QdHhrk8rTwGqkuZoRqFK6IA4yW1scSP04uLP
	YCyVd5/pK8mW+dmHo2ylk60XjjC+0hJs6xAu3j2kzo+C5E2D80pbVYDPwo/oxuPIjfyb
	LKF9U2y7igKDviW91wFDH0pY99PoqZ7Vtbp4BGaiAfdtEytcVvVwlJC5pSuyUJfuD2jG
	IEDKmtNlqSENfT9SIzKIPpr1tVzY6wS2QlUuQJFl1/GbQf24SQhkWyCkIBYIwR7W5hLI
	5t0g==
X-Gm-Message-State: AGi0PuYv3OXSUGM9oK+vhAo6F/3FbilxP7CqQMYk+E+7rQerIn1Oq8Ws
	eBzNYNA2CmqElusk4RL5GXcgXNWL8IzXAY8h8BLR
X-Google-Smtp-Source: APiQypJS0/alLMy7bq7ndJoDaDJwoqa1XyBmKZq+BvEnjQ8ZTz+/eJg171uRTBe9TJvvoGgXJ7npDm9CSyIvqPi3QxQ=
X-Received: by 2002:a17:906:f106:: with SMTP id
	gv6mr5166591ejb.271.1587158347435; 
	Fri, 17 Apr 2020 14:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <82d85f72416560c155031375fb5b32ac06394c31.1584033222.git.rgb@redhat.com>
In-Reply-To: <82d85f72416560c155031375fb5b32ac06394c31.1584033222.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 17 Apr 2020 17:18:56 -0400
Message-ID: <CAHC9VhRqytBECZ+bgo_OXavbRmPKEu0OOqS=xe=FQFhG+Qv=oA@mail.gmail.com>
Subject: Re: [PATCH ghak28 V7] audit: log audit netlink multicast bind and
	unbind events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03HLJELj001805
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@parisplace.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 17, 2020 at 12:04 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Log information about programs connecting to and disconnecting from the
> audit netlink multicast socket. This is needed so that during
> investigations a security officer can tell who or what had access to the
> audit trail.  This helps to meet the FAU_SAR.2 requirement for Common
> Criteria.  Here is the systemd startup event:
>
> type=PROCTITLE msg=audit(2020-02-18 15:26:50.775:10) : proctitle=/init
> type=SYSCALL msg=audit(2020-02-18 15:26:50.775:10) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x19 a1=0x55645c369b70 a2=0xc a3=0x7fff9fedec24 items=0 ppid=0 pid=1 auid=unset uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=(none) ses=unset comm=systemd exe=/usr/lib/systemd/systemd subj=kernel key=(null)
> type=UNKNOWN[1335] msg=audit(2020-02-18 15:26:50.775:10) : pid=1 uid=root auid=unset tty=(none) ses=unset subj=kernel comm=systemd exe=/usr/lib/systemd/systemd nl-mcgrp=1 op=connect res=yes
>
> And the events from the test suite:
>
> type=PROCTITLE msg=audit(2020-02-18 15:28:01.594:307) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> type=SYSCALL msg=audit(2020-02-18 15:28:01.594:307) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x7 a1=0x558ebc428be0 a2=0xc a3=0x0 items=0 ppid=642 pid=645 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> type=UNKNOWN[1335] msg=audit(2020-02-18 15:28:01.594:307) : pid=645 uid=root auid=root tty=ttyS0 ses=1 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=connect res=yes
>
> type=PROCTITLE msg=audit(2020-03-17 11:35:31.474:344) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> type=SYSCALL msg=audit(2020-03-17 11:35:31.474:344) : arch=x86_64 syscall=setsockopt success=yes exit=0 a0=0x7 a1=SOL_NETLINK a2=0x2 a3=0x7ffee21ca5f0 items=0 ppid=686 pid=689 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=3 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> type=UNKNOWN[1335] msg=audit(2020-03-17 11:35:31.474:344) : pid=689 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
>
> type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.051:295) : pid=674 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes

This patch looks fine to me, but this line is curious ... I'm assuming
this is just a stray/cut-n-paste-error from the last time you updated
the commit description?  If so, just let me know and I can drop it
while merging, otherwise there is something odd going on ....

> Please see the upstream issue tracker at
>   https://github.com/linux-audit/audit-kernel/issues/28
> With the feature description at
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Multicast-Socket-Join-Part
> The testsuite support is at
>   https://github.com/rgbriggs/audit-testsuite/compare/ghak28-mcast-part-join
>   https://github.com/linux-audit/audit-testsuite/pull/93
> And the userspace support patch is at
>   https://github.com/linux-audit/audit-userspace/pull/114
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
>
> ---
> Note: subj attrs included due to missing syscall record for disconnect on close
> Note: tried refactor of subj attrs, but this is yet another new order.
>
> Changelog:
> v7:
> - rename audit_log_multicast_bind to audit_log_multicast
>
> v6:
> - rebased on 5.6-rc1 audit/next and audit log BPF
> - updated patch description sample records
>
> v5:
> - rebased on 5.5-rc1 audit/next
> - group bind/unbind ops
> - add audit context
> - justify message number skip
> - check audit_enabled
> - change field name from nlnk-grp to nl-mcgrp
> - fix whitespace issues
>
> v4:
> - 2017-10-13 sgrubb
> - squash to 1 patch
> - rebase on KERN_MODULE event
> - open code subj attrs
>
> v3:
> - 2016-11-30 sgrubb
> - rebase on REPLACE event
> - minimize audit_log_format calls
> - rename audit_log_bind to audit_log_multicast_bind
>
> v2:
> - 2015-07-23 sgrubb
> - spin off audit_log_task_simple in seperate patch
>
> v1:
> - 2014-10-07 rgb
> ---
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 48 ++++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index a534d71e689a..9b6a973f4cc3 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -117,6 +117,7 @@
>  #define AUDIT_TIME_INJOFFSET   1332    /* Timekeeping offset injected */
>  #define AUDIT_TIME_ADJNTPVAL   1333    /* NTP value adjustment */
>  #define AUDIT_BPF              1334    /* BPF subsystem */
> +#define AUDIT_EVENT_LISTENER   1335    /* Task joined multicast read socket */
>
>  #define AUDIT_AVC              1400    /* SE Linux avc denial or grant */
>  #define AUDIT_SELINUX_ERR      1401    /* Internal SE Linux Errors */
> diff --git a/kernel/audit.c b/kernel/audit.c
> index b96331e1976d..612bd818f6d7 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1520,20 +1520,60 @@ static void audit_receive(struct sk_buff  *skb)
>         audit_ctl_unlock();
>  }
>
> +/* Log information about who is connecting to the audit multicast socket */
> +static void audit_log_multicast(int group, const char *op, int err)
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
> +       audit_put_tty(tty);
> +       audit_log_task_context(ab); /* subj= */
> +       audit_log_format(ab, " comm=");
> +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> +       audit_log_d_path_exe(ab, current->mm); /* exe= */
> +       audit_log_format(ab, " nl-mcgrp=%d op=%s res=%d", group, op, !err);
> +       audit_log_end(ab);
> +}
> +
>  /* Run custom bind function on netlink socket group connect or bind requests. */
> -static int audit_bind(struct net *net, int group)
> +static int audit_multicast_bind(struct net *net, int group)
>  {
> +       int err = 0;
> +
>         if (!capable(CAP_AUDIT_READ))
> -               return -EPERM;
> +               err = -EPERM;
> +       audit_log_multicast(group, "connect", err);
> +       return err;
> +}
>
> -       return 0;
> +static void audit_multicast_unbind(struct net *net, int group)
> +{
> +       audit_log_multicast(group, "disconnect", 0);
>  }
>
>  static int __net_init audit_net_init(struct net *net)
>  {
>         struct netlink_kernel_cfg cfg = {
>                 .input  = audit_receive,
> -               .bind   = audit_bind,
> +               .bind   = audit_multicast_bind,
> +               .unbind = audit_multicast_unbind,
>                 .flags  = NL_CFG_F_NONROOT_RECV,
>                 .groups = AUDIT_NLGRP_MAX,
>         };
> --
> 1.8.3.1
>


-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

