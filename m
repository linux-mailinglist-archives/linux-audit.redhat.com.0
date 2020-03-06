Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D968C17C364
	for <lists+linux-audit@lfdr.de>; Fri,  6 Mar 2020 18:00:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583514033;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QwMi5aUT1+kh6jK4+DkSvnVtOTk6h32toHQPWQZc62k=;
	b=doDVB8xve+O1KGbL8f1v6lOAvKxf71VSHHLfNZdRMiZOU+i/KHC+U/nJuFVnKULnD5ak5E
	B9duAevM6aLamFej09/0wQLOufRo5SGuSxKCTOzZ2Wd98bfVSFH08bPF5W1J9PfsjUGoUq
	o2w1biWC3yASWUP0EzfaWJpDDNAiYzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-T6DoHClhNsC5KNT0fVwiAg-1; Fri, 06 Mar 2020 12:00:30 -0500
X-MC-Unique: T6DoHClhNsC5KNT0fVwiAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1562107ACC9;
	Fri,  6 Mar 2020 17:00:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36259100EBA4;
	Fri,  6 Mar 2020 17:00:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78E7618089D0;
	Fri,  6 Mar 2020 17:00:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026Gxr14028262 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 11:59:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D1C635DA7D; Fri,  6 Mar 2020 16:59:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-13.phx2.redhat.com [10.3.117.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3BCE5DA2C;
	Fri,  6 Mar 2020 16:59:50 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: Is auditing ftruncate useful?
Date: Fri, 06 Mar 2020 11:59:50 -0500
Message-ID: <2633528.kLtZZfLx0Y@x2>
Organization: Red Hat
In-Reply-To: <bfd41bc4-7251-ef19-4ab8-6336f5eaf3f1@schaufler-ca.com>
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<4b16e97a-49d7-d558-0d87-7cdff23888b5@nwra.com>
	<bfd41bc4-7251-ef19-4ab8-6336f5eaf3f1@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, February 10, 2020 6:29:22 PM EST Casey Schaufler wrote:
> On 2/10/2020 3:05 PM, Orion Poplawski wrote:
> > On 2/10/20 3:54 PM, Paul Moore wrote:
> > So, this is all reasonable.  But why do I get this with fchown which also
> > takes a file descriptor?
> > ...
> > 
> > It's this disparity between fchown and ftruncate that caught my
> > attention.
> 
> fchown changes the security state (mode bits) of the file,
> whereas ftruncate changes the content of the file. The former
> is clearly security relevant, the latter is not.

Well, security relevant or not, the requirement that the rule meets is 
located here:

https://www.niap-ccevs.org/MMO/PP/-442-/#fau

File and object events (Successful and unsuccessful attempts to create, 
access, delete, modify, modify permissions), 

Since they separate modify and modify permissions, they clearly want changes 
to content. Now, in the real world is that necessary? Maybe only in super 
important scenarios where you have to know any change to anything.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

