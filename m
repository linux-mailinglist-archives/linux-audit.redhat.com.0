Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B43FB7B8F
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 16:05:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD83A308FB9D;
	Thu, 19 Sep 2019 14:05:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B152560126;
	Thu, 19 Sep 2019 14:05:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59BC64EDA6;
	Thu, 19 Sep 2019 14:05:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8JE59Nl021966 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Sep 2019 10:05:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9EBDF5DA21; Thu, 19 Sep 2019 14:05:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 594F15D9CC;
	Thu, 19 Sep 2019 14:05:02 +0000 (UTC)
Date: Thu, 19 Sep 2019 10:04:59 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH][RFC] audit: set wait time to zero when audit failed
Message-ID: <20190919140459.bfktuzmbih3u53e6@madcap2.tricolour.ca>
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
	<CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
	<fe43dc199f3949709828e1d96edf7556@baidu.com>
	<CAHC9VhTSBvZr0jFARoFQ2dBxQR6rsDxY6uOLaF35e9BVhNEvaA@mail.gmail.com>
	<dbfc8ea5cdc3413e829eb864430ed7dc@baidu.com>
	<CAHC9VhRQKcS2E-WwMoJ_GntXY6cKTCvaykRBF_FXG4ggvAiHLA@mail.gmail.com>
	<6fc9ae05851842ca9ea2cc2b01dccc4c@baidu.com>
	<20190918223344.3ec262cb@ivy-bridge>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918223344.3ec262cb@ivy-bridge>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 19 Sep 2019 14:05:29 +0000 (UTC)

On 2019-09-18 22:33, Steve Grubb wrote:
> On Thu, 19 Sep 2019 01:50:05 +0000
> "Li,Rongqing" <lirongqing@baidu.com> wrote:
> 
> > No need knobs, auditctl can change the backlog length and wait time.
> > And it is helpless to change the backlog length if auditd is hung
> > forever, as a task can be hung forever due to disk/filesystem's
> > abnormal, etc
> > 
> > I am saying the audit default behaviors which is changed, I truly
> > meet the issue as description of the below commit, if we can make
> > change, other can avoid this issue.
> 
> I'd like to offer an opinion because this a long term issue that we
> have faced and what exists is the result of having to meet certain
> requirements.
> 
> If the machine boots with audit=0, which I think is default, then the
> end user has no expectation of audit ever being in use. Audit events
> may be discarded if the backlog fills up.

In fact, the default is neither explicit audit=0 nor audit=1.  The case
above is the default where the audit subsystem is inactive until an
audit daemon registers with the kernel.  In the case of an explicit
kernel command line of audit=0, audit is disabled until reboot and a
daemon cannot register.

> If however the machine boots with audit=1, then the user is expecting
> that there will eventually be an audit daemon and they want all events.
> All of them without fail. So, we have to take all measures to deliver
> those events because this is required by common criteria as well as
> other security standards such as PCI-DSS.
> 
> So, there are 2 paths. One which does not care about audit and one
> that does. The original behavior did not meet requirements. If there is
> any patch that fixes this, it would be to not have an audit backlog
> wait time if audit has never been enabled. We have to be careful to
> consider audit never enabled, audit disabled but previously enabled,
> and audit enabled.
> 
> HTH...
> 
> -Steve

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
