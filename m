Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9F6522EB
	for <lists+linux-audit@lfdr.de>; Tue, 20 Dec 2022 15:44:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671547464;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uJqMNev6uzlJBV5zvyBRrn0B8lln8rxN8beNapC68CQ=;
	b=UN9nya9j9wL7WPNAappdveRLOB5ZOJTj2eEc0auqI50Ur1GVg27jEX17VKRrQtUZShbRms
	m1pYOLa3MIfi+jUhPB33oskN5KurtRYYCzmzbR5w6aIJiRx856L4JvA2TS/yKVWpnNdOJ9
	zj/Fp6XzTPr5INgoAx8/uIXJzjzCPFc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-eRuICmE2MwCCTtcsGCCryw-1; Tue, 20 Dec 2022 09:44:21 -0500
X-MC-Unique: eRuICmE2MwCCTtcsGCCryw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F8C11C05193;
	Tue, 20 Dec 2022 14:44:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D844BC16027;
	Tue, 20 Dec 2022 14:44:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F019319465B8;
	Tue, 20 Dec 2022 14:44:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 454D4194658D for <linux-audit@listman.corp.redhat.com>;
 Mon, 19 Dec 2022 10:25:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 27DA814152F6; Mon, 19 Dec 2022 10:25:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2073614152F4
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 10:25:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF7141C05B07
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 10:25:52 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-568-t2G81rsdNJOS5gF6hUY6mA-1; Mon,
 19 Dec 2022 05:25:50 -0500
X-MC-Unique: t2G81rsdNJOS5gF6hUY6mA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E8BB37323;
 Mon, 19 Dec 2022 10:25:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C19313910;
 Mon, 19 Dec 2022 10:25:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NFydDi08oGOJNAAAMHmgww
 (envelope-from <jack@suse.cz>); Mon, 19 Dec 2022 10:25:49 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id B199AA0732; Mon, 19 Dec 2022 11:10:23 +0100 (CET)
Date: Mon, 19 Dec 2022 11:10:23 +0100
From: Jan Kara <jack@suse.cz>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v5 2/3] fanotify: define struct members to hold response
 decision context
Message-ID: <20221219101023.6bqjj3jg3il2fbzf@quack3>
References: <cover.1670606054.git.rgb@redhat.com>
 <45da8423b9b1e8fc7abd68cd2269acff8cf9022a.1670606054.git.rgb@redhat.com>
 <20221216164342.ojcbdifdmafq5njw@quack3>
 <CAHC9VhQCQJ6_0RtHQHuA2FDje-3ick3b3ar8K8NAnuMF=ww2cA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQCQJ6_0RtHQHuA2FDje-3ick3b3ar8K8NAnuMF=ww2cA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 20 Dec 2022 14:44:08 +0000
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
Cc: Jan Kara <jack@suse.cz>, Richard Guy Briggs <rgb@redhat.com>,
 linux-api@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
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

On Fri 16-12-22 12:05:14, Paul Moore wrote:
> On Fri, Dec 16, 2022 at 11:43 AM Jan Kara <jack@suse.cz> wrote:
> >
> > On Mon 12-12-22 09:06:10, Richard Guy Briggs wrote:
> > > This patch adds a flag, FAN_INFO and an extensible buffer to provide
> > > additional information about response decisions.  The buffer contains
> > > one or more headers defining the information type and the length of the
> > > following information.  The patch defines one additional information
> > > type, FAN_RESPONSE_INFO_AUDIT_RULE, to audit a rule number.  This will
> > > allow for the creation of other information types in the future if other
> > > users of the API identify different needs.
> > >
> > > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > > Link: https://lore.kernel.org/r/2745105.e9J7NaK4W3@x2
> > > Suggested-by: Jan Kara <jack@suse.cz>
> > > Link: https://lore.kernel.org/r/20201001101219.GE17860@quack2.suse.cz
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> >
> > Thanks for the patches. They look very good to me. Just two nits below. I
> > can do the small updates on commit if there would be no other changes. But
> > I'd like to get some review from audit guys for patch 3/3 before I commit
> > this.
> 
> It's in my review queue, but it's a bit lower in the pile as my
> understanding is that the linux-next folks don't like to see new
> things in the next branches until after the merge window closes.

Sure, there's no hurry :). I just wanted to make it clear where the things
stand.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

