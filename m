Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 216161D1CF1
	for <lists+linux-audit@lfdr.de>; Wed, 13 May 2020 20:03:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589393035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EqOUCyp94f6DEwxrLgUcFFZXyCZlcYXTGY0fXH9zg3E=;
	b=cUpZfgIWEKKLCAS0SNaejuCnnDWUe8BRq7uZcV80oZm6P50MldtXSnmGbRztvXe6fGe3s4
	hjaTsjsBiIEJ6coQlkGtFrnFnxEYuU2snOYQ2+iImZh2zmjrHnDbbgLwdvN/gPdVOYTnBX
	fVGIJNRPa78aBTA6vpNjqsiqRO1rEU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-QMuoDNOqNQ-yOAuSUDEq9Q-1; Wed, 13 May 2020 14:03:53 -0400
X-MC-Unique: QMuoDNOqNQ-yOAuSUDEq9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4232107ACCD;
	Wed, 13 May 2020 18:03:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C6D21036D11;
	Wed, 13 May 2020 18:03:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 401F41809543;
	Wed, 13 May 2020 18:03:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DI3U1r015439 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 14:03:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE411619B2; Wed, 13 May 2020 18:03:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-116.phx2.redhat.com [10.3.113.116])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E9E8619B1;
	Wed, 13 May 2020 18:03:27 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: reactive audit proposal
Date: Wed, 13 May 2020 14:03:27 -0400
Message-ID: <7295083.E8dtrJcxLY@x2>
Organization: Red Hat
In-Reply-To: <2037581034.269445.1589390222295@mail.yahoo.com>
References: <6360160.ZmnOHIC0Qm@x2>
	<2037581034.269445.1589390222295@mail.yahoo.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, May 13, 2020 1:17:02 PM EDT Joe Wulf wrote:
> What you propose is a sound enhancement.
> I have no preference for the choice between incorporate this in the audit
> daemon versus a plugin.What would be the effort to switch from one to the
> other if later on you should find the first choice wasn't as optimal?

Well, the main idea for a plugin is not to stop processing events. Busy 
systems need to keep focused on unloading the kernel backlog.
 
> I wonder about the case where a system is booted with new media already
> attached.

During initialization, it runs through the mount table just as if the mount 
table was changed. So, it has the opportunity to apply rules during init. I'm 
borrowing code from fapolicyd which has this nicely solved. (It's one of my 
other projects.)

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

