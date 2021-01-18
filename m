Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 16D732FA1F2
	for <lists+linux-audit@lfdr.de>; Mon, 18 Jan 2021 14:46:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610977561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=58DfkpAiSDzI2m4+lUiiDJAhRHTYmrPsEo45F/B0gxY=;
	b=atLwXe0df6P5gZTvTGGBst21XRhEwIUEfH5h6lHVdyzvQpznOVTHfS5JyjrouGArjudtfm
	kYg2Zya9t6GryVBcDVPj6Y2dTUJ24ReinvPa/jt3HvtHjgYe1AgGtofTPpGsFe4AR6vt34
	/rFk+hqSAyJQaT/isQn8LOmoayoW9Kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-PBS_rO0KOlShy9curuEKkA-1; Mon, 18 Jan 2021 08:45:58 -0500
X-MC-Unique: PBS_rO0KOlShy9curuEKkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B483AA0CAA;
	Mon, 18 Jan 2021 13:45:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4B2960CCB;
	Mon, 18 Jan 2021 13:45:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1414D4A7C6;
	Mon, 18 Jan 2021 13:45:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10IDjEx8018566 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 Jan 2021 08:45:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3ADF91800D; Mon, 18 Jan 2021 13:45:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-115-68.rdu2.redhat.com [10.10.115.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC35E5C260;
	Mon, 18 Jan 2021 13:45:13 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: Possible typo in 22-ignore-chrony.rules
Date: Mon, 18 Jan 2021 08:45:13 -0500
Message-ID: <5427786.DvuYhMxLoT@x2>
Organization: Red Hat
In-Reply-To: <1824339272.504544.1610944958091@mail.yahoo.com>
References: <1824339272.504544.1610944958091.ref@mail.yahoo.com>
	<1824339272.504544.1610944958091@mail.yahoo.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sunday, January 17, 2021 11:42:38 PM EST Joe Wulf wrote:
> This snippit in both rules in that file (for both v2.8.5 and v3.0.0) "-F
> auid=unset -Fuid=chrony" for the second "-F" seems to be missing a space
> after the "-F".  Correct?

Yeah, it looks that way. Fixed. Thanks!


> IRT to the comment in this rule file, "These
> rules suppress the time-change event when chrony does time updates"; does
> that mean IF these two rules were not included or commented-out, that the
> chrony time updates would 'log' events in the audit log?

Yes.

> How do these rules 'work' to suppress chrony time updates from being
> logged? 

The audit rules is a first match wins system. These rules are in a file with a 
22 in the name which preceeds rules whose file name starts with 30. In 30-
stig.rules, we have a rule that asks for any use of adjtimex to be logged 
which is the syscall chrony uses to update time. Since the rule in 22 has a 
never action and it preceeds the one from the stig, it matches first and takes 
the never action which is not to log it.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

