Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 33C5C14726F
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jan 2020 21:13:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579810431;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rrYhg/GeU3BbUf/1E55DZTmpZKOpXoAvjHE9OM0jwqQ=;
	b=JRIDDAYv5unywHFkTcAlyFvECoZ+6n4NUCEHhCXixetb7XA1Q9fis0LbnFs/OfC10oRWKO
	0ZmLQCeu8egU6My4Xaq8imijRPyyf8BdzqaLg0+fjxqx5LivvePmvT8S44iAAyDTJU/uw8
	3FZnMG05+0WscJjt3VI85tp8MPigi9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-KH6raVW3P6OCH28TvLh94Q-1; Thu, 23 Jan 2020 15:13:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3524E107ACC7;
	Thu, 23 Jan 2020 20:13:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB5A219756;
	Thu, 23 Jan 2020 20:13:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8ABEF1803C33;
	Thu, 23 Jan 2020 20:13:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NKBn2c030809 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 15:11:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ABD035E249; Thu, 23 Jan 2020 20:11:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-176.phx2.redhat.com [10.3.116.176])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4DBC5DA89;
	Thu, 23 Jan 2020 20:11:42 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: [PATCH ghak28 V4] audit: log audit netlink multicast bind and
	unbind events
Date: Thu, 23 Jan 2020 15:11:42 -0500
Message-ID: <2543770.gFq7b6OZdx@x2>
Organization: Red Hat
In-Reply-To: <20200123161349.z55l2dd7qsyhoxbn@madcap2.tricolour.ca>
References: <ca70ee17d85860aa599e0001a75d639d819de7ae.1579292286.git.rgb@redhat.com>
	<CAHC9VhTcv9E8DUDJ2Y-PzXmU0_+ufVydbPB3Q_Fhb8-7TUZMmg@mail.gmail.com>
	<20200123161349.z55l2dd7qsyhoxbn@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@parisplace.org>,
	nhorman@redhat.com, LKML <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: KH6raVW3P6OCH28TvLh94Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, January 23, 2020 11:13:49 AM EST Richard Guy Briggs wrote:
> Steve, can you say why this order should be the standard?  From:
>         http://people.redhat.com/sgrubb/audit/record-fields.html

The majority of events go down the path of:
pid,uid,auid,ses,subj,op,comm,exe,res

Which lands on the parse_user() function.

If for some reason we really wanted to stay on a "kernel" parser, then I'd 
recommend:
auid,uid,ses,subj,pid,comm,exe,op,res

which lands on the parse_kernel_anom() function.

Either of those have complete information and requires no syscall record.

-Steve


> I get:
>         SYSCALL/ANOM_LINK/FEATURE_CHANGE
>                 ppid    pid     auid    uid     gid     euid    suid   
> fsuid   egid    sgid    fsgid   tty     ses     comm    exe     subj
> ANOM_ABEND/SECCOMP
>                                 auid    uid     gid     ses     subj    pid
>     comm    exe LOGIN
>                 pid     uid     subj    old-auid        auid    tty    
> old-ses ses SYSTEM_BOOT/SYSTEM_SHUTDOWN
>                 pid     uid     auid    ses     subj    comm    exe
>         USER_LOGIN
>                 pid     uid     auid    ses     subj    uid     exe
>         DAEMON_START
>                                 auid    pid     uid     ses     subj
>         DAEMON_CONFIG/DAEMON_END
>                                 auid    pid     subj
>         ANOM_PROMISCUOUS
>                                 auid    uid     gid     ses
>         52msgs
>                 pid     uid     auid    ses     subj    *
>         CONFIG_CHANGE
>                                 auid    ses     subj
> 
> This new record is:
>         EVENT_LISTENER
>                 pid     uid     auid    tty     ses     subj    comm    exe
> 
> And using the search criteria following, I get no other matches:
>         /pid.*uid.*auid.*tty.*ses.*subj.*comm.*exe
> so this appears to be a new field order.




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

