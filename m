Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3EE78D7B8
	for <lists+linux-audit@lfdr.de>; Wed, 30 Aug 2023 18:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693414645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gabtRfOc3iZZe7aA1gGPm6eS8/R4xLttacX+56UWScw=;
	b=F2gDTBrGz/uyh5kUmLJVErO4AB3fPXnrK55UlhjtmIEYx1A+o3IF5J2IdfUvUqC2+lQnIs
	nAYibjSF+CVAtoPP1YbVy5TJ9dOzoMvez4hYvUHBPNnZ4ME3MXIZ9aV4Ko7bEu1IEUyv3Y
	6BzqdNu226EawZD/yh+BlMyOGxM6nGQ=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-wsOhmukoOz6yLZz_tuCrFg-1; Wed, 30 Aug 2023 12:57:23 -0400
X-MC-Unique: wsOhmukoOz6yLZz_tuCrFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0EDF3801F7F;
	Wed, 30 Aug 2023 16:57:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5FA8140E96E;
	Wed, 30 Aug 2023 16:57:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3B3AC1946A73;
	Wed, 30 Aug 2023 16:57:16 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CAA121946589 for <linux-audit@listman.corp.redhat.com>;
 Wed, 30 Aug 2023 15:47:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ACA1D401E63; Wed, 30 Aug 2023 15:47:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A535240610F
 for <linux-audit@redhat.com>; Wed, 30 Aug 2023 15:47:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A60085CBF3
 for <linux-audit@redhat.com>; Wed, 30 Aug 2023 15:47:14 +0000 (UTC)
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-DmWocfCzMKepbIa3oibcrg-1; Wed,
 30 Aug 2023 11:47:12 -0400
X-MC-Unique: DmWocfCzMKepbIa3oibcrg-1
Received: from [78.30.34.192] (port=40836 helo=gnumonks.org)
 by ganesha.gnumonks.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pablo@gnumonks.org>)
 id 1qbNPQ-002QQq-1N; Wed, 30 Aug 2023 17:47:10 +0200
Date: Wed, 30 Aug 2023 17:47:07 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Phil Sutter <phil@nwl.cc>
Subject: Re: [nf PATCH 2/2] netfilter: nf_tables: Audit log rule reset
Message-ID: <ZO9ke6vqGPz3OGY1@calendula>
References: <20230829175158.20202-1-phil@nwl.cc>
 <20230829175158.20202-2-phil@nwl.cc>
MIME-Version: 1.0
In-Reply-To: <20230829175158.20202-2-phil@nwl.cc>
X-Spam-Score: -1.9 (-)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Wed, 30 Aug 2023 16:57:14 +0000
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
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com,
 netfilter-devel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: netfilter.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 29, 2023 at 07:51:58PM +0200, Phil Sutter wrote:
> Resetting rules' stateful data happens outside of the transaction logic,
> so 'get' and 'dump' handlers have to emit audit log entries themselves.

Also applied to nf, thanks

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

