Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CBA6617C3FE
	for <lists+linux-audit@lfdr.de>; Fri,  6 Mar 2020 18:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583514929;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+OldTylTftgO3QyaSbQ/GFKlLMNxR7A+aKt20bwBldE=;
	b=f0hgLfFUKIUAabLE9UF4iR5LNCMNLt+IvqQO+jER7t0RN9RdUPOklASe7FwbV6HryBx0w+
	juWgfu3wGvJEl5PZdpcVVPdQ/CIoWtpp2k9VisVaNX9+AdfSHXxYPECwDbX5hSj1o+/Ur9
	V2ItR1/K3I5Lj6WdBNugfXkI0y91S2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-j0lRj4ulOq21iQZY3w6PSg-1; Fri, 06 Mar 2020 12:15:27 -0500
X-MC-Unique: j0lRj4ulOq21iQZY3w6PSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F26B184C801;
	Fri,  6 Mar 2020 17:15:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 538071001B07;
	Fri,  6 Mar 2020 17:15:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57C2A84484;
	Fri,  6 Mar 2020 17:15:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026HF8kh029084 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 12:15:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA89B60BFB; Fri,  6 Mar 2020 17:15:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-13.phx2.redhat.com [10.3.117.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E129160BE0;
	Fri,  6 Mar 2020 17:14:59 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v15 00/23] LSM: Module stacking for AppArmor
Date: Fri, 06 Mar 2020 12:14:59 -0500
Message-ID: <52786936.4IqQbOQo6H@x2>
Organization: Red Hat
In-Reply-To: <658202b8-c257-e74f-1769-af40cb2325ab@schaufler-ca.com>
References: <20200222000407.110158-1-casey.ref@schaufler-ca.com>
	<853ac380-2132-febe-fda0-ff0a0a74d480@schaufler-ca.com>
	<658202b8-c257-e74f-1769-af40cb2325ab@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-audit@redhat.com, James Morris <jmorris@namei.org>
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

On Tuesday, March 3, 2020 12:22:31 PM EST Casey Schaufler wrote:
> On 2/27/2020 9:29 AM, Casey Schaufler wrote:
> > On 2/21/2020 4:03 PM, Casey Schaufler wrote:
> >> Resending the audit related patches to the audit list,
> >> as there have been problems with the CC lists.
> > 
> > There's an awful lot of interaction between the module stacking
> > and the audit sub-system. I have not gotten much feedback about
> > the audit changes recently, but I can't bring myself to think
> > this means there aren't any concerns. Before I start pushing for
> > the stacking to get pulled I would really appreciate either ACKs
> > or meaningful comments from the audit community. I can see that
> > there's a lot going on in the audit sub-system, and appreciate
> > that priorities may be elsewhere.
> > 
> > Thank you.
> 
> I have to start pushing on this series. If the audit community
> hasn't any additional feedback, I'll take it that what's here is
> acceptable and move my lobbying efforts elsewhere.

There is a limit in user space that may cause problems.

MAX_AUDIT_MESSAGE_LENGTH    8970 // PATH_MAX*2+CONTEXT_SIZE*2+11+256+1

This has been in place for years. This is designed to hand the AUDIT_PATH 
record which can have PATH_MAX * 2 for name field, then it has 11 bytes set 
aside for other fields, then 256 bytes to handle the largest possible SELinux 
label. So, if we are agoing to stab other LSM's into the object identifier, 
how big is it? Do you have a max size that everyone has to fit into?

Changing this constant in user space is not something that you set and are 
done. Everything will need recompiling.

And one other question, no field names are changing because of this are they? 
And if a distribution has only 1 LSM, will anyone notice a change in format?

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

