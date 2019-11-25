Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4052D108F06
	for <lists+linux-audit@lfdr.de>; Mon, 25 Nov 2019 14:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574689095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e1awYdhz8gn32pMJd6EOSAGHe0mqmWEmtyaX6TsHhJ0=;
	b=gSxCDlun3KFDlP6B9WJA5b04RHPbiVALY5sr1dCFalSws8YIEpiO6UHBY7Dukja2GEkl5w
	LC67F34y24HgYp5yzbHm4Q1vCmRC7A2H9laDUcsB+l5CPZDpL2Se8v3xCEYLhA+SSvMsRC
	67AA6bVrTGKNFBQYOkO68su4vNvddZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-09WbLL8iM66yP0bJ_HY-OQ-1; Mon, 25 Nov 2019 08:38:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0245107BAA5;
	Mon, 25 Nov 2019 13:38:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE5A3600C8;
	Mon, 25 Nov 2019 13:38:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C422318089C8;
	Mon, 25 Nov 2019 13:38:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAPDbxw3019383 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 08:37:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C9D26600CA; Mon, 25 Nov 2019 13:37:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-255.phx2.redhat.com [10.3.116.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E054600C6;
	Mon, 25 Nov 2019 13:37:54 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)"
	<vezhavendan.1.kadirvadivelu.ext@nokia.com>
Subject: Re: Security audit rules
Date: Mon, 25 Nov 2019 08:37:53 -0500
Message-ID: <2921353.XK4XxU5UnF@x2>
Organization: Red Hat
In-Reply-To: <AM0PR07MB41489140C4DD0E0017244C05B24B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
References: <AM0PR07MB414818424612036066D01E9BB27B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
	<2526162.J9WsBpnIYZ@x2>
	<AM0PR07MB41489140C4DD0E0017244C05B24B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 09WbLL8iM66yP0bJ_HY-OQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sunday, November 24, 2019 1:44:03 AM EST Kadirvadivelu, Vezhavendan 1. 
(EXT - IN/Chennai) wrote:
> That's clear on the rules. Thanks for that, but my question is where should
> I place the file called 'audit.rules'. It should be under '/etc/audit' or
> '/etc/audit/rules.d' or in both places.

Nowhere. audit.rules is built by augenrules using the sorting method 
described in the man page for it. Again, there is a README-rules file that 
explains how this works. If you have specific things that you would like to 
add, then make a file for it and place it in /etc/audit/rules.d where it will 
get combined with other rule files. README-rules gives suggestions about how 
to name the file for predictable inclusion.

-Steve


> -----Original Message-----
> From: Steve Grubb <sgrubb@redhat.com>
> Sent: Friday, November 22, 2019 10:39 PM
> To: linux-audit@redhat.com
> Cc: Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)
> <vezhavendan.1.kadirvadivelu.ext@nokia.com>; Richard Guy Briggs
> <rgb@redhat.com> Subject: Re: Security audit rules
> 
> On Tuesday, November 19, 2019 11:36:38 PM EST Kadirvadivelu, Vezhavendan 1.
> (EXT - IN/Chennai) wrote:
> > I am using RHEL7.6 version (Red Hat Enterprise Linux 7 (Maipo)).
> 
> This distribution wants rules placed in /etc/audit/rules.d/ The audit
> package should have a file named README-rules that explains what is
> expected.
> 
> -Steve
> 
> > -----Original Message-----
> > From: Richard Guy Briggs <rgb@redhat.com>
> > Sent: Wednesday, November 20, 2019 4:03 AM
> > To: Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)
> > <vezhavendan.1.kadirvadivelu.ext@nokia.com> Cc: linux-audit@redhat.com
> > Subject: Re: Security audit rules
> > 
> > On 2019-11-08 12:52, Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)
> 
> wrote:
> > > Hi,
> > > 
> > > In one of the VM I find audit.rules defined under /etc/audit as well
> > > as /etc/audit/rules.d.
> > > 
> > > What is the significance as well as difference between the files
> > > found in
> > > 2 places.
> > 
> > You haven't said what distro you are using.  In more recent distros,
> > the rules in rules.d are used by augenrules to populate audit.rules,
> > overwriting them.
> > 
> > > Also please let me know what is the correct location where
> > > audit.rules need to be places.
> > 
> > Depends on your distro.
> > 
> > > Vezhavendan K
> > 
> > - RGB
> > 
> > --
> > Richard Guy Briggs <rgb@redhat.com>
> > Sr. S/W Engineer, Kernel Security, Base Operating Systems Remote,
> > Ottawa, Red Hat Canada IRC: rgb, SunRaycer
> > Voice: +1.647.777.2635, Internal: (81) 32635
> > 
> > 
> > --
> > Linux-audit mailing list
> > Linux-audit@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-audit




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

