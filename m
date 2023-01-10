Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C02664A6E
	for <lists+linux-audit@lfdr.de>; Tue, 10 Jan 2023 19:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673375592;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o/5xOZPSwjwhWrLTOQ2G2+puvotuhFzThsFsTVII6F0=;
	b=HHbJGJFmRanqQo73lyASEXUhjW8vWCOUg1ROm3aI+MSoSqfxJodsWR+HB6tptA5VpFJtbB
	BZX+8TiRDgZYG8QVLBeNT93QR6fUewz8x0d8f1jT2P3a5eh6w1orBpiuR81NsxqlkW8reE
	Wvsrnuj6hKVtwcw3CCTAIzbL8OeqVIk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-etfHkU_APfmAmRPnrx3e5w-1; Tue, 10 Jan 2023 13:33:11 -0500
X-MC-Unique: etfHkU_APfmAmRPnrx3e5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2A78811E6E;
	Tue, 10 Jan 2023 18:33:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87E40C16031;
	Tue, 10 Jan 2023 18:32:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 01FCF194E122;
	Tue, 10 Jan 2023 18:32:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 94DFC1946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 18:32:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F0429492B02; Tue, 10 Jan 2023 18:32:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3EF0492B00;
 Tue, 10 Jan 2023 18:32:42 +0000 (UTC)
Date: Tue, 10 Jan 2023 13:32:40 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH v5 3/3] fanotify, audit: Allow audit to use the full
 permission event response
Message-ID: <Y72vSB+dEgD4HMCN@madcap2.tricolour.ca>
References: <cover.1670606054.git.rgb@redhat.com> <3211441.aeNJFYEL58@x2>
 <Y7zWlFbrrNcfGauJ@madcap2.tricolour.ca> <4778109.GXAFRqVoOG@x2>
MIME-Version: 1.0
In-Reply-To: <4778109.GXAFRqVoOG@x2>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, linux-api@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-01-10 10:26, Steve Grubb wrote:
> Hello Richard,
> 
> On Monday, January 9, 2023 10:08:04 PM EST Richard Guy Briggs wrote:
> > When I use an application that expected the old API, meaning it simply
> > does:
> > > 
> > > response.fd = metadata->fd;
> > > response.response = reply;
> > > close(metadata->fd);
> > > write(fd, &response, sizeof(struct fanotify_response));
> > > 
> > > I get access denials. Every time. If the program is using the new API and
> > > sets FAN_INFO, then it works as expected. I'll do some more testing but I
> > > think there is something wrong in the compatibility path.
> > 
> > I'll have a closer look, because this wasn't the intended behaviour.
> 
> I have done more testing. I think what I saw might have been caused by a 
> stale selinux label (label exists, policy is deleted). With selinux in 
> permissive mode it's all working as expected - both old and new API.

Ah good, thank you.

> -Steve

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635
--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

