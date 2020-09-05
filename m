Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2F25B25E9A4
	for <lists+linux-audit@lfdr.de>; Sat,  5 Sep 2020 20:14:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-LRLysJI5OOeqCo1d1Kl14A-1; Sat, 05 Sep 2020 14:14:17 -0400
X-MC-Unique: LRLysJI5OOeqCo1d1Kl14A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF9291888A01;
	Sat,  5 Sep 2020 18:14:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FB2162A27;
	Sat,  5 Sep 2020 18:14:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1025618561B1;
	Sat,  5 Sep 2020 18:14:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 085IDkik001122 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 14:13:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F9962156A2D; Sat,  5 Sep 2020 18:13:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19D8D2156A23
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 18:13:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B284856DE8
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 18:13:43 +0000 (UTC)
Received: from sonic316-26.consmr.mail.ne1.yahoo.com
	(sonic316-26.consmr.mail.ne1.yahoo.com [66.163.187.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-340-EhL3CcKCN2GxzUL6HDpsmA-1;
	Sat, 05 Sep 2020 14:13:40 -0400
X-MC-Unique: EhL3CcKCN2GxzUL6HDpsmA-1
X-YMail-OSG: IFmoKMUVM1nizGgMYPYmhPubsKcpRdDtc5T2YgjJZpK8khILtvHF7f3XCGt8IaW
	_98sglczXQ.Amb3x8DpGqky0AcxjMZbttxR9JT626SjAAU33T_R1wMC4TVJ9WwImPgKYHT8sHuc_
	hgwyQSEveMiWb9K32dFL2LtkdKFyoDMX1A5Mbs.v7K1JnvbtrZ03MBq8LPP6ERePDOts.OuK0PTo
	cyBw9qczfoavT9dch41XX70XnnJ2R5vhIIhu7P75V2hUuX21jvN4RvQtNcgbKwwBz0twLqTNq.WX
	sxHND4NkXiBUU9Tlgg4qO5FHXdf6Nb1rWn7tOE2cRNx_oVr5Qz1A9M6rvPArD.VaBo2nBcTdCme6
	X_nBUDBSxWfHg0tO1Jy7MvHCkeZTCAboeiE3VpQcKowfg_EcLXddG404xhOJmtZ4PfNgOTRp3pCj
	nFWjI_DQEkPT_.MhvVWZP1anXxqBNJiwQUVTNu37mriUmL6agjH9Lo9mURG2vFTITIhPyyI0lBXX
	PHoglbo3ubmlOTjpFCqKIbDzrjep6UJXgQ1.8x8bsV7qde5UpAbx6iKDDzm5j_451S7tSaZ3ZPp3
	LeNUewJVRkEc_rlZT5v9jI5X9a0pPKgefG2bKT6RoIq1A6GV07fMK5.fbt_ucj31kbvwcZpJq022
	kBLi9EgkJXvOS6GulRu7i6ZOqW5uG8hUeyKFmnAhZRuAftilCuzIRqsLgLEIlXiTXn0tj1yA03et
	CCLvmygIPD6yV_seaNnDctSHxEwC3E9r22tDRoHhh7kNpu_eNdlFt24LowZ30HP52ahTJa2.DUp2
	7er9h3vcc6nI3peUuNBGs81kR_INnpJnPgZGuHvtQB4mSsAcXv.hDUolRSPywHNNIKtB8oNOyFJj
	s74fsiCtdQo5llmuoVRrhOYlmjL_qDwdKoD6eHrv1yrZwumjmGe8LDMg7vcAP2txiC7a0OW.BaLX
	gOjGGitC5FHFoZoySkoN4hS2paQyEIsXnK5hMNXMJKcpvVxBjU7rw4YP5FGu_qQhaqbbAFkeQDC3
	dh6dEPiLyo.4dhHg0vJPnbVfperroHcShValNnUTf6XsbdrNnIhQdZ5X_RPX1FCzd6bKMEgR9lIv
	SBn6gvv6rttcKoGR_PTyhvKerpQQy.hCTJWK7pI.9jq3h30u0.NPzjp8l5inPan.hJuYj6tF_90_
	3S.iC4lW3i.fOP_wLjZACYC8vU37BdoiW_Bb6UTNRwkvlSOAEZi6N6OX0uwZGrTE5jMuGz_BUNz3
	19IiY8V7vMT5JTmdoGdNhWbv9lLOnpVIJLq4XROcdh9wRhCWn9fjXQDdF7YHB9iI_m3LIMktqyYn
	GsZAET6tu7llHpJ5.mOWe.YxiwO3lT5kd9H6iCj6tozRL3ZYBZgfRfG8gX2RHLyW2kF5JU2Kb0q5
	sqwt0w5QzHVkvOG9FZk4QjXjpJEb6ECwDoP9c9RnR5lX4hg6Y3iRXFXO376P69aLsMzIQKpFPpaS
	uivj8PNafyiMUm0aFVJLPW90q8CPJ0zRhtNwXCTe56ilxTfvuzcgVa2LtHnYq1Cd8sOeDsYI7rpt
	jqCLNXKehiHVVYEX2OAKpye0-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 5 Sep 2020 18:13:40 +0000
Received: by smtp418.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 8257eb48b2411bfbf1cddde3139cdf96; 
	Sat, 05 Sep 2020 18:13:36 +0000 (UTC)
Subject: Re: [PATCH v20 05/23] net: Prepare UDS for security module stacking
To: Paul Moore <paul@paul-moore.com>
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-6-casey@schaufler-ca.com>
	<CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
	<1eeef766-405f-3800-c0cf-3eb008f9673e@schaufler-ca.com>
	<CAHC9VhSf8RWUnRPYLR6LLzbn-cvNg8J0wnZGwTOAe=dOqkvd0g@mail.gmail.com>
	<ef6a049a-c6b9-370b-c521-4594aa73e403@schaufler-ca.com>
	<CAHC9VhSu4qqKWsutm3=GF_pihUKpwjAtc9gAhfjGsGtKfz-Azw@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <585600d7-70fb-0982-1e6b-ffd7b7c33e32@schaufler-ca.com>
Date: Sat, 5 Sep 2020 11:13:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSu4qqKWsutm3=GF_pihUKpwjAtc9gAhfjGsGtKfz-Azw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/5/2020 6:25 AM, Paul Moore wrote:
> On Fri, Sep 4, 2020 at 7:58 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 9/4/2020 2:53 PM, Paul Moore wrote:
>>> On Fri, Sep 4, 2020 at 5:35 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>> On 9/4/2020 1:08 PM, Paul Moore wrote:
> ...
>
>>> I understand the concerns you mention, they are all valid as far as
>>> I'm concerned, but I think we are going to get burned by this code as
>>> it currently stands.
>> Yes, I can see that. We're getting burned by the non-extensibility
>> of secids. It will take someone smarter than me to figure out how to
>> fit N secids into 32bits without danger of either failure or memory
>> allocation.
> Sooo what are the next steps here?  It sounds like there is some
> agreement that the currently proposed unix_skb_params approach is a
> problem, but it also sounds like you just want to merge it anyway?

There are real problems with all the approaches. This is by far the
least invasive of the lot. If this is acceptable for now I will commit
to including the dynamic allocation version in the full stacking
(e.g. Smack + SELinux) stage. If it isn't, well, this stage is going
to take even longer than it already has. Sigh.


> I was sorta hoping for something a bit better.

I will be looking at alternatives. I am very much open to suggestions.
I'm not even 100% convinced that Stephen's objections to my separate
allocation strategy outweigh its advantages. If you have an opinion on
that, I'd love to hear it.

Thank you 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

