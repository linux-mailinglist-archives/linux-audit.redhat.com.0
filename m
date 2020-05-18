Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED071D8AAF
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 00:22:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589840528;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CxetmQ/DoKrUiF7FMaoT3xxO+eFVXf5J8tB3ekIXANI=;
	b=TfYOsbJ9ucBzM7SQfI9d7VzWDCgULwBAeiZelttkNspd2m6dpcolUyF0fBHJWCd467+Vrn
	X7wX1CAkdE47wKYuy0rwRIqbvB0OGZiQePV2l3Eoaq9hUHL0WxehY6RisY/ZPAN29LujoW
	MSKbpSehL2IGKdquy+3MeYsS3y1N8qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-qpd1TG4sPDKEz1SE9NIzxQ-1; Mon, 18 May 2020 18:22:06 -0400
X-MC-Unique: qpd1TG4sPDKEz1SE9NIzxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF2351005510;
	Mon, 18 May 2020 22:21:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A81316E6F9;
	Mon, 18 May 2020 22:21:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00F0C4ED30;
	Mon, 18 May 2020 22:21:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04IMLcVG027461 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 18:21:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF1FE10FFE4B; Mon, 18 May 2020 22:21:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAAFD10FFE46
	for <linux-audit@redhat.com>; Mon, 18 May 2020 22:21:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 184148007C8
	for <linux-audit@redhat.com>; Mon, 18 May 2020 22:21:35 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-226-BIz4Rm_qOKy8jHLZ2lsuTQ-1; Mon, 18 May 2020 18:21:30 -0400
X-MC-Unique: BIz4Rm_qOKy8jHLZ2lsuTQ-1
Received: by mail-ej1-f68.google.com with SMTP id j21so5454630ejy.1
	for <linux-audit@redhat.com>; Mon, 18 May 2020 15:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/khCYfvJEp72aEqdH7BrT4a+JRMptLGYxJW5cDAT0VQ=;
	b=hmvCI9lGnTP9GuZg5a+eXr8TechaGP+hryCmcL2PBvBtELvsLOhn3e+09zpGzCCH7v
	wFdU/WjKxaQQ0zgHPt03x9B4A+LbyOvK0aqyMhN/H7E5k5hfuDJwISwAVUztDTQUFdWb
	FGXcFS3Oz6YuGBsvXF8PcrahkPmP84xhQg4GegIiZao/X8sy5yh1VwfTNZtxkMlkjGfX
	tUvUVUH6ieI1sF9pTQx7MXjJXLM9/0UotiOteajSv3FGiGvrK/TZg2GsLsyWFa2ecoBt
	S42GJucsHuOY07Fv5fsb12owemkO1swPWmq0MrvsPPRAGYLauFB8sufZKlHu8CbdKXID
	jOEw==
X-Gm-Message-State: AOAM532nvAf0rorn0uCCyJUPkFzyr4YZA/izaQG888YETy+zUT7AH6nj
	lOKDpad2y3CqVSkbbNFBQEQc7RJdVo73dn4lHcYH
X-Google-Smtp-Source: ABdhPJxpjFGQF2cDWV2Gc9cYzue2wCv56sWBwoEReBksaoN/La+DH2JVIYX9PtMKTN6q0RRPCdwNZZ45A0QmG28p/dI=
X-Received: by 2002:a17:906:b881:: with SMTP id
	hb1mr7547072ejb.77.1589840489057; 
	Mon, 18 May 2020 15:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200514221142.11857-1-casey@schaufler-ca.com>
	<20200514221142.11857-21-casey@schaufler-ca.com>
	<CAEjxPJ67cA_A-Oh72EGgmCrP6k9x0PuaU2q7UL9eOc+J6Do0zQ@mail.gmail.com>
	<9cabbb54-69e6-91e6-88f8-e76d53da2a77@schaufler-ca.com>
In-Reply-To: <9cabbb54-69e6-91e6-88f8-e76d53da2a77@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 May 2020 18:21:17 -0400
Message-ID: <CAHC9VhRGopG0=DbEZArz2X2yfEQ1pOqoSLRMn9ABe5JYZB2Y8Q@mail.gmail.com>
Subject: Re: [PATCH v17 20/23] Audit: Add a new record for multiple subject
	LSM attributes
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: John Johansen <john.johansen@canonical.com>,
	SElinux list <selinux@vger.kernel.org>,
	Richard Guy Briggs <rgb@redhat.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	James Morris <jmorris@namei.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 18, 2020 at 4:43 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 5/18/2020 11:02 AM, Stephen Smalley wrote:
> > On Thu, May 14, 2020 at 7:30 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> Create a new audit record type to contain the subject information
> >> when there are multiple security modules that require such data.
> >> This record is emitted before the other records for the event, but
> >> is linked with the same timestamp and serial number.
> >>
> >> Reviewed-by: Kees Cook <keescook@chromium.org>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >> Cc: linux-audit@redhat.com
> >> ---
> > With this patch, I see userspace audit records like this one:
> >
> > type=SYSTEM_BOOT msg=audit(1589816792.181:103): pid=789 uid=0
> > auid=4294967295 ses=4294967295 subj=? subj=system_u:system_r:init_t:s0
> > msg=' comm="systemd-update-utmp"
> > exe="/usr/lib/systemd/systemd-update-utmp" hostname=? addr=?
> > terminal=? res=success'
> >
> > I'm guessing that userspace is appending the second subj= field when
> > it sees subj=? or otherwise is missing subj= information?
>
> I haven't looked at the userspace code, but I expect you're right.
> It looks like there will need to be some change in the userspace
> for the multiple LSM case. The "completion" shown here isn't correct,
> because it only fills in one of the subject attributes, not both.

Wait, didn't we agree on a a "subj=? subj_selinux=XXX
subj_apparmor=YYY subj_smack=ZZZ" format?  It looks like there are two
'subj' fields in the record above which is bad, don't do that please.

> > Then we have kernel audit records like this:
> >
> > type=PROCTITLE msg=audit(1589816791.959:101): proctitle=2F7362696E2F617564697463
> > 746C002D52002F6574632F61756469742F61756469742E72756C6573
> > type=SYSCALL msg=audit(1589816791.959:101): arch=c000003e syscall=44
> > success=yes exit=1056 a0=3 a1=7fff9ccc98a0 a2=420 a3=0 items=0
> > ppid=773 pid=783 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0
> > egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="auditctl"
> > exe="/usr/sbin/auditctl" subj=? key=(null)
> > type=UNKNOWN[1420] msg=audit(1589816791.959:101):
> > subj_selinux=system_u:system_r:unconfined_service_t:s0
> > subj_apparmor==unconfined
> > type=CONFIG_CHANGE msg=audit(1589816791.959:101): auid=4294967295
> > ses=4294967295 subj=? op=add_rule key=(null) list=1 res=1
> > type=UNKNOWN[1420] msg=audit(1589816791.959:101):
> > subj_selinux=system_u:system_r:unconfined_service_t:s0
> > subj_apparmor==unconfined
> >
> > where we are getting multiple copies of the new record type, one for
> > each record type that had subj=?.
>
> While obviously wasteful, the type=1420 behavior is consistent with
> the subj=? behavior, which is to duplicate the subj= value. I know
> we've got enough hobgoblins in the audit system that we don't need
> to add any more in the name of a foolish consistency.

You need to provide a bit more reason why we need byte-for-byte
duplicate records in a single event.  As it currently stands this
looks like something we definitely don't want.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

