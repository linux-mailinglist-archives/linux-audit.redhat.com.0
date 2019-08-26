Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E769D78E
	for <lists+linux-audit@lfdr.de>; Mon, 26 Aug 2019 22:43:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C23B190C01D;
	Mon, 26 Aug 2019 20:43:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A32E10016EA;
	Mon, 26 Aug 2019 20:43:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBF074A486;
	Mon, 26 Aug 2019 20:43:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7QKh9ti020105 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 26 Aug 2019 16:43:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B65D6060D; Mon, 26 Aug 2019 20:43:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 561616092D
	for <linux-audit@redhat.com>; Mon, 26 Aug 2019 20:43:06 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AAC63082B13
	for <linux-audit@redhat.com>; Mon, 26 Aug 2019 20:43:05 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id q27so3731984lfo.10
	for <linux-audit@redhat.com>; Mon, 26 Aug 2019 13:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p1NZAj4MoRkEkLRbyMnIKojmRRt6i7vvfvZf586VwIo=;
	b=BhBSgTH8xbSi4yH5k6ZClji6uofBcvgRFuCrXQ+CfzrGpCHRlBrmOUJoIDPK1Gut9A
	WeahJGrJaNFNJwh0c/HgVZ5jPoTI/vpzov6ASOuJQEtACsUmt+Beyil6eR8J/Sss3A87
	OGpnVux86xYACb9VXRrwuzhiAyIqJfCWBBHWywTueMKLM8lD7uDSxeV8QSQ9hDqpCFUd
	bfkaSEWpK6hDVV0fDEMpS1NHcTuH8tbbhqk/7kWxtF7SXHZ1LpnYNJph7ydAOBf15ESd
	u7M9Rxl/8fsyV5YrpZ3WWzTS4/AYyQrC5ytQBACXDLrNCEDWRjQOZdMUFw9l8YZq0pXH
	N87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p1NZAj4MoRkEkLRbyMnIKojmRRt6i7vvfvZf586VwIo=;
	b=mjeHJXTeJMmPS3QyoMOK0BpS3TywIivGlIEdqSYG2tj4PT3ji2LlJ9MIwNao8aC+HV
	r/+YfkcwF6msqGtodGm4cSJ4+hnx285mJhJZwF7Sm2NG0DDmL7n9yXFgacz+6WMuYbyc
	j2NJpVUILyZfAKeLZYSclIdASit8xDLlC3G0c3BoeDq72PmwRIeeN4yU0EDs/zDFAAQl
	aRsTbEpk2hrpYEKwPBUemhij0Tc+ondWWyxq6NCN3Hz0j/tT5f4Hqwy/93W30MrANqJW
	T/OA3tnxhiK1ZooHX1ztZGzfaGbbbBiB+5d4nS5kCJG4pzbJeronCnRjFdETK4uQmifw
	snRQ==
X-Gm-Message-State: APjAAAVh3Kut8XMB8/g4KwM2lxDis7xG2J2DTP1/5hvQbTUY+sKbkMGw
	7O0gnRdFcMweIuwJw5Eq+UzZF+hmwb8lAb306nHQ
X-Google-Smtp-Source: APXvYqw98hCeYYBXk4YZHX6MIRcUUU+QfmECiO74pTKPAWw5m13mQig24osCxIldeAW+pbY5W0hdOp3iRnl5sSj14J4=
X-Received: by 2002:ac2:4474:: with SMTP id y20mr2537810lfl.31.1566852183926; 
	Mon, 26 Aug 2019 13:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <4997df37-4a80-5cf5-effc-0a6f040c4528@huawei.com>
	<CAHC9VhS_DCBRX6kkmiSYBzq+ELN2AYRypRN6vR_J1+JOi2FDvw@mail.gmail.com>
	<ce8efa9d-f2b6-5adc-0442-c73e632c6903@huawei.com>
In-Reply-To: <ce8efa9d-f2b6-5adc-0442-c73e632c6903@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 26 Aug 2019 16:42:52 -0400
Message-ID: <CAHC9VhS8Rq8J9MBUvqNeEO9pQRzx7mT=EfDagw=MQ2oO8jHbyw@mail.gmail.com>
Subject: Re: [Question] audit_names use after delete in audit_filter_inodes
To: Chen Wandun <chenwandun@huawei.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 26 Aug 2019 20:43:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Mon, 26 Aug 2019 20:43:05 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Mon, 26 Aug 2019 20:43:29 +0000 (UTC)

On Thu, Aug 22, 2019 at 3:22 AM Chen Wandun <chenwandun@huawei.com> wrote:
> On 2019/8/21 23:36, Paul Moore wrote:
> > On Wed, Aug 21, 2019 at 5:31 AM Chen Wandun <chenwandun@huawei.com> wrote:
> >>
> >> Hi,
> >> Recently, I hit a use after delete in audit_filter_inodes,
> >
> > ...
> >
> >> the call stack is below:
> >> [321315.077117] CPU: 6 PID: 8944 Comm: DefSch0100 Tainted: G           OE  ----V-------   3.10.0-327.62.59.83.w75.x86_64 #1
> >> [321315.077117] Hardware name: OpenStack Foundation OpenStack Nova, BIOS rel-1.8.1-0-g4adadbd-20170107_142945-9_64_246_229 04/01/2014
> >
> > It looks like this is a vendor kernel and not an upstream kernel, yes?
>
> I analysed the upstream kernel about audit, and found there is no significant change
> in audit_names add/read/delete since v3.10.

The number of changes in a Linux v3.10 based distro kernel and a
modern upstream are quite significant, regardless of what you might
see by comparing a limited number of functions/structs.  I once again
suggest you contact your distribution provider for support, or move to
a modern Linux kernel so that upstream can better understand your
problem.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
