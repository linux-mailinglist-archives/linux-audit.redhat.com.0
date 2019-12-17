Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9909B1239EE
	for <lists+linux-audit@lfdr.de>; Tue, 17 Dec 2019 23:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576621494;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SddwJWQuvHvv4lGv06RKGaa39tAJ+cf90OOGNBRIRD4=;
	b=ch9IUUhq1aF8gHA76eMaefmTUGoEI0DmCgs7XczElWWuyWvDTuDevnABKXr2r6YfvRxoHx
	CPHM9RJVFXPSRa+YmmLY08kQhl8dZWluPx+mMhZq/TkIB/Sq04qBZyDIYDuokX9V+FN1jR
	zVU3ZYdwp0+rSzt8c+8b3UGTZTvdv/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-SI87Qf7QNLy5CcSx7MkSEw-1; Tue, 17 Dec 2019 17:24:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6C27800EC0;
	Tue, 17 Dec 2019 22:24:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 624E85C28D;
	Tue, 17 Dec 2019 22:24:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99ADD18089CD;
	Tue, 17 Dec 2019 22:24:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBHMOUgZ010510 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Dec 2019 17:24:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 36787A4B60; Tue, 17 Dec 2019 22:24:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-249.phx2.redhat.com [10.3.116.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95C637C81A;
	Tue, 17 Dec 2019 22:24:27 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
Subject: Re: Matching SSHD information in audit logs
Date: Tue, 17 Dec 2019 17:24:27 -0500
Message-ID: <4141319.LxKeKsHKUW@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D95429822D170@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429822CB57@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<2177815.HFh0nK17a1@x2>
	<5F4EE10832231F4F921A255C1D95429822D170@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: SI87Qf7QNLy5CcSx7MkSEw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, December 17, 2019 12:16:14 PM EST MAUPERTUIS, PHILIPPE wrote:
> > > What are the corresponding events in audit ?
> > 
> > I don't think anyone has ever tried to map between syslog and audit. I
> > also think that CIS maybe doesn't understand audit and how it works. For
> > quite some time, there has been a requirement to log any key lifecycle
> > in the audit logs. This means that the DH key exchange and the session
> > keys get logged when they are created and when they are destroyed. Also,
> > pam logs the session
> > beginning and end. And sshd logs any keys that it accepts. So, I think
> > the information is there if one wanted or needed to map between them. But
> > it should be unnecessary. I'm not sure what CIS is looking for in syslog.
> > Because if there is something important in syslog that is not in the
> > audit logs, I'd like to know what it is.
> > 
> > > My main concern is with the bold line which indicates how the public
> > > key was granted
> > 
> > That should also be in the audit logs.
> 
> I find in the audit log which key has been accepted but not that it has
> been accepted due to /usr/bin/sss_ssh_authorizedkeys (and not a local
> authorized_keys file). In the USER_AUTH message I can see a field
> grantors=auth-key but I don't know how to interpret it.

The grantors part comes from pam. It is used to describe what in the pam 
stack allowed the access. Sshd should use "pubkey_auth" somewhere in the 
event if it granted the access.

> I had a look at
> https://github.com/linux-audit/audit-documentation/blob/master/specs/field
> s/field-dictionary.csv but grantor is not mentioned there I didn't other
> fields as well :
> From SOFTWARE_UPDATE the fields sw, sw_type, key_enforce are not listed.
> The page
> https://github.com/linux-audit/audit-documentation/blob/master/specs/messa
> ges/message-dictionary.csv doesn't mention the type SOFTWARE_UPDATE Maybe I
> am looking at the wrong place, Where should I look ?

This has not been updated in a long time. The source code is where I go to 
find the truth about anything.  :-)

> > > Could you point me to a documentation showing which events a ssh login
> > > would generate ?
> > 
> > To my knowledge, there is no document that singles out what a sshd login
> > should look like. There are documents that explain what the record type
> > are. And you should be able to isolate them by ausearch -x sshd.
> 
> What I missed was this ausearch -x sshd which gives me the events

OK. Good. Glad that was helpful.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

