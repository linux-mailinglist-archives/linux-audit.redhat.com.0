Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 47C821D8AFB
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 00:32:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589841132;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q6ijw1f9wOVCpOAnPXbFRcAqHze9oRusglQFATbQe8Q=;
	b=RARZKNZzrLxNEScrDiutqljs230hRGHJOI6tuzf5Hz02r2G0AJTA7NuACvxqCtp25CXqOV
	bXb4oTeeB7r3Lu6JjOt0DQ+V1jOQDwtDNwX2bt5sBKpD0r/vluSJjKLBcnL8RCBM2sOj9k
	56xoCGSDQVP6TFWSUcMh3dWcptn6W8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-ZHK3V1drOkqr9ZhPvFsvqw-1; Mon, 18 May 2020 18:32:09 -0400
X-MC-Unique: ZHK3V1drOkqr9ZhPvFsvqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5215780B723;
	Mon, 18 May 2020 22:32:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5363460C81;
	Mon, 18 May 2020 22:32:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C59D04ED3C;
	Mon, 18 May 2020 22:32:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04II2kb5005073 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 14:02:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 211BE2029F70; Mon, 18 May 2020 18:02:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0396B200BCE6
	for <linux-audit@redhat.com>; Mon, 18 May 2020 18:02:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E77F98001E9
	for <linux-audit@redhat.com>; Mon, 18 May 2020 18:02:43 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-fncehbsUM1m9Y--eKY1jIA-1; Mon, 18 May 2020 14:02:39 -0400
X-MC-Unique: fncehbsUM1m9Y--eKY1jIA-1
Received: by mail-ot1-f68.google.com with SMTP id 63so8867010oto.8
	for <linux-audit@redhat.com>; Mon, 18 May 2020 11:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V96esMl9kY8PDjjxARiIacJ7SwY1HHwKiiG/ZCJEGVA=;
	b=CIu3KKUgODwJHkMAIMAVNzpK1kncfkIOJV9rGaSdk0kypax2vvY3iVFwMU1EJyx4lt
	1RtjJLn1GaIUk/rYPQRjR3iUsl5pCxi/y44ABqjNzws89TWdns4mcDUe1ylrHJQU8yNu
	gri7se6O+AB7w4SprIA74505klOBuT1t0A+CbOHveRS0PJnl1aD+GYZa9HhInjv1s6FQ
	TQn/k9gts2mInPn1bSgIfRGI+Ux2u44Gg5lmxTB15p/rJM3b6BKMD811wP4SX2lhOioR
	wbGGsbSD/95KcDe+lr7KA/LfnNZXjtpCpUK8v9j2Fdaef9/rNYtn5gPTWS/KK7pAaZyn
	hS6Q==
X-Gm-Message-State: AOAM533QNnGkZj7Q1rbDrweLMPP0+gAk2Rz+yEva6tbNiMJo3uBBx2wP
	A8aQNVSi31vAktOjjRCnGUHk4iIGgI9+Pl5WKo4=
X-Google-Smtp-Source: ABdhPJzYIskN4JjoiUhXsYSRAVez668ir0Cpz2K5pJyR4ES1G2z6OZgaOH8xjQbCK2NX2Q0owFhVd5xdBxkvcCgiSsQ=
X-Received: by 2002:a05:6830:158b:: with SMTP id
	i11mr3663509otr.135.1589824958083; 
	Mon, 18 May 2020 11:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200514221142.11857-1-casey@schaufler-ca.com>
	<20200514221142.11857-21-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-21-casey@schaufler-ca.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 18 May 2020 14:02:27 -0400
Message-ID: <CAEjxPJ67cA_A-Oh72EGgmCrP6k9x0PuaU2q7UL9eOc+J6Do0zQ@mail.gmail.com>
Subject: Re: [PATCH v17 20/23] Audit: Add a new record for multiple subject
	LSM attributes
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 18 May 2020 18:31:55 -0400
Cc: John Johansen <john.johansen@canonical.com>,
	SElinux list <selinux@vger.kernel.org>, James Morris <jmorris@namei.org>,
	LSM List <linux-security-module@vger.kernel.org>,
	linux-audit@redhat.com, casey.schaufler@intel.com,
	Stephen Smalley <sds@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 14, 2020 at 7:30 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Create a new audit record type to contain the subject information
> when there are multiple security modules that require such data.
> This record is emitted before the other records for the event, but
> is linked with the same timestamp and serial number.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: linux-audit@redhat.com
> ---

With this patch, I see userspace audit records like this one:

type=SYSTEM_BOOT msg=audit(1589816792.181:103): pid=789 uid=0
auid=4294967295 ses=4294967295 subj=? subj=system_u:system_r:init_t:s0
msg=' comm="systemd-update-utmp"
exe="/usr/lib/systemd/systemd-update-utmp" hostname=? addr=?
terminal=? res=success'

I'm guessing that userspace is appending the second subj= field when
it sees subj=? or otherwise is missing subj= information?

Then we have kernel audit records like this:

type=PROCTITLE msg=audit(1589816791.959:101): proctitle=2F7362696E2F617564697463
746C002D52002F6574632F61756469742F61756469742E72756C6573
type=SYSCALL msg=audit(1589816791.959:101): arch=c000003e syscall=44
success=yes exit=1056 a0=3 a1=7fff9ccc98a0 a2=420 a3=0 items=0
ppid=773 pid=783 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0
egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="auditctl"
exe="/usr/sbin/auditctl" subj=? key=(null)
type=UNKNOWN[1420] msg=audit(1589816791.959:101):
subj_selinux=system_u:system_r:unconfined_service_t:s0
subj_apparmor==unconfined
type=CONFIG_CHANGE msg=audit(1589816791.959:101): auid=4294967295
ses=4294967295 subj=? op=add_rule key=(null) list=1 res=1
type=UNKNOWN[1420] msg=audit(1589816791.959:101):
subj_selinux=system_u:system_r:unconfined_service_t:s0
subj_apparmor==unconfined

where we are getting multiple copies of the new record type, one for
each record type that had subj=?.

Not sure what it is the audit folks want here.

This is with multiple LSMs enabled; need to confirm that no change
occurs if only one is enabled.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

