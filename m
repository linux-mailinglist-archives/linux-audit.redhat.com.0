Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C65DAB7197
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 04:33:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C695730860A5;
	Thu, 19 Sep 2019 02:33:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BA44100197A;
	Thu, 19 Sep 2019 02:33:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 365B94E58A;
	Thu, 19 Sep 2019 02:33:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J2XkSx015241 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 22:33:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1D8C5C21A; Thu, 19 Sep 2019 02:33:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from ivy-bridge (ovpn-121-8.rdu2.redhat.com [10.10.121.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2DD3513C8;
	Thu, 19 Sep 2019 02:33:43 +0000 (UTC)
Date: Wed, 18 Sep 2019 22:33:44 -0400
From: Steve Grubb <sgrubb@redhat.com>
To: "Li,Rongqing" <lirongqing@baidu.com>
Subject: Re: [PATCH][RFC] audit: set wait time to zero when audit failed
Message-ID: <20190918223344.3ec262cb@ivy-bridge>
In-Reply-To: <6fc9ae05851842ca9ea2cc2b01dccc4c@baidu.com>
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
	<CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
	<fe43dc199f3949709828e1d96edf7556@baidu.com>
	<CAHC9VhTSBvZr0jFARoFQ2dBxQR6rsDxY6uOLaF35e9BVhNEvaA@mail.gmail.com>
	<dbfc8ea5cdc3413e829eb864430ed7dc@baidu.com>
	<CAHC9VhRQKcS2E-WwMoJ_GntXY6cKTCvaykRBF_FXG4ggvAiHLA@mail.gmail.com>
	<6fc9ae05851842ca9ea2cc2b01dccc4c@baidu.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 19 Sep 2019 02:33:53 +0000 (UTC)

On Thu, 19 Sep 2019 01:50:05 +0000
"Li,Rongqing" <lirongqing@baidu.com> wrote:

> No need knobs, auditctl can change the backlog length and wait time.
> And it is helpless to change the backlog length if auditd is hung
> forever, as a task can be hung forever due to disk/filesystem's
> abnormal, etc
> 
> I am saying the audit default behaviors which is changed, I truly
> meet the issue as description of the below commit, if we can make
> change, other can avoid this issue.

I'd like to offer an opinion because this a long term issue that we
have faced and what exists is the result of having to meet certain
requirements.

If the machine boots with audit=0, which I think is default, then the
end user has no expectation of audit ever being in use. Audit events
may be discarded if the backlog fills up.

If however the machine boots with audit=1, then the user is expecting
that there will eventually be an audit daemon and they want all events.
All of them without fail. So, we have to take all measures to deliver
those events because this is required by common criteria as well as
other security standards such as PCI-DSS.

So, there are 2 paths. One which does not care about audit and one
that does. The original behavior did not meet requirements. If there is
any patch that fixes this, it would be to not have an audit backlog
wait time if audit has never been enabled. We have to be careful to
consider audit never enabled, audit disabled but previously enabled,
and audit enabled.

HTH...

-Steve

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
