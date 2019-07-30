Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C52A7B514
	for <lists+linux-audit@lfdr.de>; Tue, 30 Jul 2019 23:36:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 480B6309174E;
	Tue, 30 Jul 2019 21:36:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55E575D9C9;
	Tue, 30 Jul 2019 21:36:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7612041F53;
	Tue, 30 Jul 2019 21:36:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6ULaLMF021205 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 17:36:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B92465D6D0; Tue, 30 Jul 2019 21:36:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-31.phx2.redhat.com [10.3.112.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DB025D6B2;
	Tue, 30 Jul 2019 21:36:16 +0000 (UTC)
Date: Tue, 30 Jul 2019 17:36:13 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: boot parameter question
Message-ID: <20190730213613.deuqgp433ieumuge@madcap2.tricolour.ca>
References: <e8fbd095-9983-528e-dc8e-602280b414d8@magitekltd.com>
	<20190729223249.wvzvqmjwzxeg4p54@madcap2.tricolour.ca>
	<f30a6c9e-e203-9e29-139a-dda3aa0e73f9@magitekltd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f30a6c9e-e203-9e29-139a-dda3aa0e73f9@magitekltd.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 30 Jul 2019 21:36:32 +0000 (UTC)

On 2019-07-30 15:06, Lenny Bruzenak wrote:
> On 7/29/19 4:32 PM, Richard Guy Briggs wrote:
> > It is being ignored because that kernel command line extension to the
> > original feature was never backported to RHEL7.
> 
> That would definitely do it.
> 
> > In hindsight, that would have been pretty useful without causing much
> > risk.  Normally feature backport is driven by customer demand.  There
> > was a bit of pushback when it was first introduced upstream, but this is
> > exactly the scenario I envisioned where it would be most useful.  It is
> > possible to compile your own kernel and change the default value, but
> > that's obviously a hurdle for most.
> 
> It would definitely have been useful, some might say even necessary,
> given the audit event startup noise occurring with systemd.

Yes, this was yet another difficulty that arose with the change to
systemd from rhel6 to rhel7.  The intent was to solve it first in fedora
when it switched to systemd to address this since the number of startup
messages jumped from manageable within the default backlog size to
almost double.  There are also other improvements upstream that remove
some of the doubt about exactly how many log messages were lost.

> Wow. Thanks Richard, I appreciate the answer on this.

It is all there in fedora and RHEL8, so that is one possible route.  It
is a bit late in the RHEL7 life cycle to commit to it, but not
impossible...

> LCB
> 
> -- 
> Lenny Bruzenak

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
