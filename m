Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4A61F107639
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 18:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574442547;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F2QZaZ8MUgXJm49SR+lTYFI9eUpDdkeoqU+ZrTwfuVU=;
	b=WPFbASY7GqUGYo7CjCgVP3SgaxU+vyhX+l5S/+7R+R0R/QWv2161WRg81UHErinnSZ0mUf
	U04LtPky8Z4y3fZBrEvhnUmXJPanaan5u0oOqymbP7o+VFqlmdDjcQv/54KMRWaykELvpr
	PcZQUUkOYlre2gRy4eKF7kZjPsOLYxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-WzEP7c3PNTq403eWvXcciA-1; Fri, 22 Nov 2019 12:09:05 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3205593D6;
	Fri, 22 Nov 2019 17:08:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E331B600C6;
	Fri, 22 Nov 2019 17:08:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABB6718089C8;
	Fri, 22 Nov 2019 17:08:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMH8f10024559 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 12:08:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3543F35F4; Fri, 22 Nov 2019 17:08:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-118-24.phx2.redhat.com [10.3.118.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E93B662675;
	Fri, 22 Nov 2019 17:08:32 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Security audit rules
Date: Fri, 22 Nov 2019 12:08:31 -0500
Message-ID: <2526162.J9WsBpnIYZ@x2>
Organization: Red Hat
In-Reply-To: <AM0PR07MB4148C22E0204056F7EB36DC7B24F0@AM0PR07MB4148.eurprd07.prod.outlook.com>
References: <AM0PR07MB414818424612036066D01E9BB27B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
	<20191119223243.inqd4yz5dsnr6gpg@madcap2.tricolour.ca>
	<AM0PR07MB4148C22E0204056F7EB36DC7B24F0@AM0PR07MB4148.eurprd07.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, "Kadirvadivelu,
	Vezhavendan 1. \(EXT - IN/Chennai\)"
	<vezhavendan.1.kadirvadivelu.ext@nokia.com>
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
X-MC-Unique: WzEP7c3PNTq403eWvXcciA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, November 19, 2019 11:36:38 PM EST Kadirvadivelu, Vezhavendan 1. 
(EXT - IN/Chennai) wrote:
> I am using RHEL7.6 version (Red Hat Enterprise Linux 7 (Maipo)).

This distribution wants rules placed in /etc/audit/rules.d/
The audit package should have a file named README-rules that explains what is 
expected.

-Steve

> -----Original Message-----
> From: Richard Guy Briggs <rgb@redhat.com>
> Sent: Wednesday, November 20, 2019 4:03 AM
> To: Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)
> <vezhavendan.1.kadirvadivelu.ext@nokia.com> Cc: linux-audit@redhat.com
> Subject: Re: Security audit rules
> 
> On 2019-11-08 12:52, Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai) 
wrote:
> > Hi,
> > 
> > In one of the VM I find audit.rules defined under /etc/audit as well as
> > /etc/audit/rules.d.
> > 
> > What is the significance as well as difference between the files found in
> > 2 places.
> You haven't said what distro you are using.  In more recent distros, the
> rules in rules.d are used by augenrules to populate audit.rules,
> overwriting them.
> > Also please let me know what is the correct location where audit.rules
> > need to be places.
> Depends on your distro.
> 
> > Vezhavendan K
> 
> - RGB
> 
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems Remote, Ottawa,
> Red Hat Canada IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
> 
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

