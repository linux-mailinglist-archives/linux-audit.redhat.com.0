Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D51E02B94A1
	for <lists+linux-audit@lfdr.de>; Thu, 19 Nov 2020 15:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605796469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MZmFwpDZqYaVYuTVr5mfNwNgqWyBUCnT/IHlT56WovI=;
	b=L1ZnNGEgYtlzhEtTf3ER5qNKLpdvTUPqS9AeUrF0qfrhv1cclb5pT5lEyrcmcHVVitX+Su
	wZosWeVyphr1vGKG/Fl31IhGwxy1k0EgiWIpxmpl4zmQ5rwscdFVRvTtl52LQA82lv7+BM
	NkToIDOARBno8fZ/1PEJI03LZ3UwBRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-vjFanqP2O-ahVs8QlLaWfA-1; Thu, 19 Nov 2020 09:34:27 -0500
X-MC-Unique: vjFanqP2O-ahVs8QlLaWfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C357B107ACE6;
	Thu, 19 Nov 2020 14:34:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9382260BE2;
	Thu, 19 Nov 2020 14:34:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 806AF4BB40;
	Thu, 19 Nov 2020 14:34:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJEY9v5012328 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 09:34:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B0BCD60853; Thu, 19 Nov 2020 14:34:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-44.rdu2.redhat.com [10.10.116.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CC7260843;
	Thu, 19 Nov 2020 14:34:06 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-audit@redhat.com, Andreas Hasenack <andreas@canonical.com>
Subject: Re: Default logging with no rules
Date: Thu, 19 Nov 2020 09:34:04 -0500
Message-ID: <3080581.aeNJFYEL58@x2>
Organization: Red Hat
In-Reply-To: <CANYNYEGD9843AVu787kvczXyqBx1_+9PXW8g6TDUac2PyQ9O+g@mail.gmail.com>
References: <CANYNYEGD9843AVu787kvczXyqBx1_+9PXW8g6TDUac2PyQ9O+g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, November 19, 2020 9:04:24 AM EST Andreas Hasenack wrote:
> I read in an old presentation (~2011) that these come from "trusted
> apps",

There are only 10 - 15 apps that are "trusted apps". They are logging events 
that are required by various security standards such as common criteria, DISA 
STIG, PCI DSS, etc.

> and in fact any process with cap_audit_write (iirc) can log
> such events. 

While that may be true, it is generally not the case that they do in fact 
log.

> The tip was that exclude/never list/action could be used to reduce this
> noise, is that still the case and recommended approach?

If you must, sure. Trusted app events are in the 1100-1199 range. But which 
app is causing the problems that you see? In the past, we had to silence 
crond because it was noisy.

> Or is there a way to use audit with only the rules defined in /etc/audit/
> rules.d?

The rules in that dir are insufficient to fulfill regulatory requirements. If 
you are doing some kind of syscall experiment, then I can see that you might 
want to turn them off. But if your aim is meeting some kind of standard, then 
other events are required.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

