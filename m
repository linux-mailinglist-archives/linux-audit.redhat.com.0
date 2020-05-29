Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA571E8722
	for <lists+linux-audit@lfdr.de>; Fri, 29 May 2020 21:02:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590778977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V8vk6uk6Km/xRq8qNa4rsgEoqicE1UdweGy748qM4i4=;
	b=Nqqyg11I12cWvTQHlFFUDNkwm0zpVxVZwpdWjR39aFEvYXbrOtpa2J6/rXOQiyE8WNr3wG
	qWXs3Pl5bD20GljZnohfie8J/cNJXsbsfpeGswv6i/y9b2a3cGmokk1E/7pwQu98WQMadl
	C8rh2SSnCT4wEzkV9Bgdeu/wec2rXwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88--ZoqrtUCPcqRJ8BVZQoe9w-1; Fri, 29 May 2020 15:02:53 -0400
X-MC-Unique: -ZoqrtUCPcqRJ8BVZQoe9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CE8E100CCC1;
	Fri, 29 May 2020 19:02:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6963A5C1B5;
	Fri, 29 May 2020 19:02:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D0A76EF5E;
	Fri, 29 May 2020 19:02:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TJ2Bg3011971 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 15:02:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCF13F6CD9; Fri, 29 May 2020 19:02:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B853CF6CC1
	for <linux-audit@redhat.com>; Fri, 29 May 2020 19:02:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90CE48007D4
	for <linux-audit@redhat.com>; Fri, 29 May 2020 19:02:04 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-459-u8KUp3jsMZyK8MqZMLGB1g-1; Fri, 29 May 2020 15:02:01 -0400
X-MC-Unique: u8KUp3jsMZyK8MqZMLGB1g-1
Received: by mail-ej1-f44.google.com with SMTP id l27so3127894ejc.1
	for <linux-audit@redhat.com>; Fri, 29 May 2020 12:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yPJtj4+qUb8IfkdS1T+qt5tadYObI8kK3EYDbOARuvc=;
	b=R56du7F8VMSysGkRjR7kub4zcLu35T12UqjJG64q0ge+zDTlNQUg3H+0pGv4NU/7Qd
	9bugiLeNyUhpXTx8A0MEqg9du0m/qMGgq1XdcmXXaRXQdkWCaSKi30Ck0Dxs3yFLSgKs
	TQHo7vJFxlggiM0JnkCkAvSoalf7iZzAn1h3CklKaTCQPwsGYb4GXhrDAil6ZTIzFddD
	RpXZkaDOUvVkC6H5B313yU6A9Y6xXFBqmhj3brHflTL2PfrB2IAnKJvWbHuhkiOq5Trm
	oYhRtsUdb3GvemLcnFihX/kpHs4bI5mTs21ZKWAs6hbJRkd+e6XKOPgDAnvsk7mq0o50
	470Q==
X-Gm-Message-State: AOAM533ZkXdTvPpi9pJ4pDGLs1YDiH04QEdIOnGuVjlJ+NEgAPrQsHFz
	yr6Nv7PNbV696gQhtbXE9WLm1i66EgGSjlHSC+uFsCQ=
X-Google-Smtp-Source: ABdhPJxTRDObnuzGCtw/vqlCZQZ+nOHHcqmRhOaonVpnmxqPsZkzXY2SVP7TwR2mpsvAqtXwJuYqbn5iX8gNhFxVOCM=
X-Received: by 2002:a17:907:b13:: with SMTP id
	h19mr8677526ejl.488.1590778920327; 
	Fri, 29 May 2020 12:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <45ce3357-ca82-8721-22d6-dabe751ad8fa.ref@schaufler-ca.com>
	<45ce3357-ca82-8721-22d6-dabe751ad8fa@schaufler-ca.com>
In-Reply-To: <45ce3357-ca82-8721-22d6-dabe751ad8fa@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 29 May 2020 15:01:49 -0400
Message-ID: <CAHC9VhQL9Q=b75o3Y6o4VvQb97tgkhqbJ4z3zQUBm6wsWvUF9A@mail.gmail.com>
Subject: Re: The audit "context" and when to expect it.
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 29, 2020 at 1:59 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> What does a NULL audit context (e.g. ab->cxt == NULL) tell
> me about the status of the audit buffer? It seems like it should
> be telling me that the audit buffer is being created for some
> purpose unrelated to the current task. And yet there are places
> where information is pulled from the current task even when
> the cxt is NULL.

The simple answer is that a NULL audit_context indicates a standalone
record, meaning a record with a unique timestamp so that it is not
associated with any other records into an event.  If the audit_context
it not NULL then the information in the context is used to group, or
associate, all of the records sharing that context into a single
event.

This is just one example, but a non-NULL audit_context is how PATH
records end up being associated with SYSCALL records in a single
event.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

