Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA5D2FDCD1
	for <lists+linux-audit@lfdr.de>; Thu, 21 Jan 2021 00:11:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611184313;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZcG/vhl5a3UEf7KHVW8ouUg4vGj7otU5gc1vEWXOjcE=;
	b=MIPRZjUidlKxJaRPcMkQFVkiWg7pF2ApVZFrLLbgfWlI9Jk4usl84MvxXy5fF46zWFwqxs
	Nltr0llhDAilwaJgwlcyDPymrv3CJRFm0nxJKpEBz85hE97fAwPkwBkvVgkoMk3RJwDA/f
	KvxzG8pkPXqtgkJjBL8mOrtCIeYexxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-tsOX3pylM9-_MlfXxCi3iw-1; Wed, 20 Jan 2021 18:11:51 -0500
X-MC-Unique: tsOX3pylM9-_MlfXxCi3iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8A79107ACE6;
	Wed, 20 Jan 2021 23:11:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D63660C6D;
	Wed, 20 Jan 2021 23:11:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA704180954D;
	Wed, 20 Jan 2021 23:11:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KN8p6c012920 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 18:08:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 571F860C74; Wed, 20 Jan 2021 23:08:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-140.phx2.redhat.com [10.3.114.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C49060C6D;
	Wed, 20 Jan 2021 23:08:45 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: Re: 2nd Round AuditRules Questions
Date: Wed, 20 Jan 2021 18:08:44 -0500
Message-ID: <7207971.EvYhyI6sBW@x2>
Organization: Red Hat
In-Reply-To: <316007965.1268500.1611102131083@mail.yahoo.com>
References: <316007965.1268500.1611102131083.ref@mail.yahoo.com>
	<316007965.1268500.1611102131083@mail.yahoo.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Tuesday, January 19, 2021 7:22:11 PM EST Joe Wulf wrote:
> 1.  The rules for monitoring '/etc/passwd', '/etc/shadow', '/etc/group',
> '/etc/gshadow' exist.  Shouldn't corresponding rules also exist for the
> same four files which also have a dash/hyphen appended to them (i.e.
> '/etc/passwd-', etc...)?

You can add them if you want to. But I'm not planning to add them to the 
audit repo. There are requirements around monitoring changes of security 
attributes. This is covered by auditing events hardwired in the utilities 
that update them such as shadow utils. However, an admin could also use vi or 
nano to directly edit the files. That is all the watch is for. The files with 
the '-' are not used for authentication or setting up any user subject 
binding.

> 2.  By adding 'audit=1' to grub kernel boot param's---can I then safely
> eliminate this piece from all audit rules:  '-F auid!=4294967295'?

It depends on your intent. But this has nothing to do with audit=1.

> Conversely, what harm would it do to 'just leave it'?

Your logs will be flooded by daemon activity instead of things that people do.

> It would, in some cases, satisfy certain vulnerability scanning tools
> seeking exact syntax compliance, right?

I have no idea about what anyone would be compliant to. So, its hard to make 
a blanket statement. If you need to audit daemon activity and users, then yes 
you would want to remove the '-F auid!=4294967295'. But your logs will fill up 
much quicker.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

