Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4FA606C20
	for <lists+linux-audit@lfdr.de>; Fri, 21 Oct 2022 01:42:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666309350;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c5RJ4mG8/WqR9A+UxhSo228okNnpkK0qU+b/3fKxzYs=;
	b=KANnn2bP+c43/s8T4889Wuu2JJxKHLdztbOVWqSlvfU7NCS1E7PrqZq09EAo6ETEIEn5hp
	EY0U56WODQLRROw6HejwqL/NfmgqmVLunAnWix4ukc9rqmOVInvReTPpzeVVQcCAyrb71/
	h2MPMG2B5XEv2ViGTLRaUl0YbeBc+fo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-CN1aQ91mPrav5XnWZ4Qzyg-1; Thu, 20 Oct 2022 19:42:26 -0400
X-MC-Unique: CN1aQ91mPrav5XnWZ4Qzyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA3FF3C02B76;
	Thu, 20 Oct 2022 23:42:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DCA749AFD;
	Thu, 20 Oct 2022 23:42:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5E4119465A4;
	Thu, 20 Oct 2022 23:42:19 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E85581946587 for <linux-audit@listman.corp.redhat.com>;
 Thu, 20 Oct 2022 23:42:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AFDA740C6EC4; Thu, 20 Oct 2022 23:42:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7FF140C6EC3
 for <linux-audit@redhat.com>; Thu, 20 Oct 2022 23:42:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A7B8630CC
 for <linux-audit@redhat.com>; Thu, 20 Oct 2022 23:42:13 +0000 (UTC)
Received: from sonic306-28.consmr.mail.ne1.yahoo.com
 (sonic306-28.consmr.mail.ne1.yahoo.com [66.163.189.90]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-134-ao1nX9B7NFKwWIb6JViqNw-1; Thu,
 20 Oct 2022 19:42:11 -0400
X-MC-Unique: ao1nX9B7NFKwWIb6JViqNw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666309330; bh=R/3JbMN9lfHknive0qn6sbuvnm/GqGh1VGmM3zN3yJx=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=USX4h9tBzG978n0IM+oZbuWrsq0Fq0YGj2pRgqivqvsD7jTODfUq5EOK5lLVEb2RHuClTEeArF/1kydv1BreD2lJkBlvgW9bmZs2rZmHyWq4IgEzFSZrxFHu1bM5HimkxYRkhuRlJjzDrp4oyebm+Y6LSE5oNyPnD66zmMDXhZC31kWZDLH2BM9GIsXCv5jVllfUw6tU1B8yf1ER4vxia2y21tFTpGcfY6rJzrKpLsHKA+gWYFF4/ZVkZnqIhW7SPcjYp4IovL9GmT5PacArUy+4dhbGjrY1jD7Kil1NA0O77nSr81QIq9Syhw4My//+WW3XqtQg0ohCDjYCHQ0xnQ==
X-YMail-OSG: IEVbw1YVM1lqZ_LzZ4UpMqXtNV8WoDJX7Eo0kYY34UcqisNoIH7LsWa_7kS6vnJ
 1v7CZXjW_noROX74Oc.w.avDj6ZVVh08Iuh6cOLfHW5uONl_vHl18kyz5LOQHwUx5AXyMVs2SxrN
 zurVxX73AvlCx2kQ5o_xhebjWspBMU.wvJFCprW_eU4Rp4Omyxz3jkknsQWBbWk1WR9HhMs9yDHL
 FaL_u5a69D36cm0URE663LbZeE4reCck0MJTbr8DY_.6RdwBL2FPOQregk_eFC3uMPkO2kDtWnxb
 C.81bYAwMnLRjzeVFgSPkHd9DjWApq1d1t2BC6xeZfjHk_4J74vPh_6jrgVNjXRp5j8ArHbMgFVq
 tYDsWjz6Uw_nUBkVT7I7Jal.5PJiw9qHrBxzueMz8yjahT2PnBw3pp1nP.Aw23DvSOH1wtZElZCD
 e7Mpyx0x4rSt_HIqep15dXJTl3vdECaW5psSxy0lRtkovIPsjDldkctv7EV7XrPcvvD4.A48ylEE
 6.S8w.8r0bP1UNd8Y77SbTh2Jr2Yk8o3_o51RjI5VA9JY2ktBxDO.C5KqSvAUKu2o1HXpwZeMmj0
 sJm4o0B3bxjTnqRjP5uRU_mfFeKgyir1Hw2cBm.SRmS0BpmteZt6oNoZ1l7OGwQ3JjR3RjKp5S3G
 .RBMhFRaZMV6xxJ6ssn16OdBKrNU.cffDPX4Wb6PkiX37T4xoDYL9dtXe877u6P857x.7vIpXAN8
 FJNR5hhSJzzD_8NxuFk125tSYkBSHqRT7sbJQMguklqorvlkXLV1V7D.o6YPnFWnX7EF4vR2h6qL
 2vb52qWjpADv3sQO2Il0Q8nwItyMQLQCe0wdull889uPzGw27VPanmxtPP9ZlTKYGQfmHSUGwlDU
 .1YnnYMmYT2BC5QWXKzwfzZPMyfgIPzl3JWFpH903PhHJlB1BQOfKyA90vynkdgFzaRfLUQuGb3p
 Eb8_5ddCHwpm_ZHestGVeFCUvBcInvS5ZaHLPFzv5zY9drjwXJLDMyeQYfV8TULpXyWHPsAO3Rmw
 M3iLX37ttXbZpHkp0ekEWJm3ItuljeZcBVqrsqaMVL9lWNlq4v.n2BHjMNd.6PeVSf_MsTe9Hhse
 GAQdGrlvp.qzgFYy0MoGIe4mJ8PkaPTeJuM.GxWREVgg7v_SiEGheBbIdzfvW1EBaUE9CqpCfD5Z
 WUZBF3gBWfyE6tfC1VssSya2ffniydcojldekWjESaXTJAFfqcU1eZ0zj0A86auSTNw4VkWp.Kjn
 fcdQM08uvckp3JSZAiB04ihWoh1ifZdMgoAc4BwOGbAH9uAn8iIpUPrQRYF6.O.4aImRB563Gv0S
 1nZT2iS9G7yWTnd0jkihlybpE5iX2o1is8plx5JXAuJy1fVTa1NeEn6gcpPnH.gDR6M1TYK90w9s
 ehEZFcyTUP.Atuk79MhnzPN36R640i4_vyIwUVCbOxb9YOTNEpjtfjN2pLtDNmOp0IyVmELllOtJ
 RQRaTdTO70dWiNPePFjHtyOAl0GqWqdE_TnlUk37R26bSJbPz7cbQhCh46g0.sBxDXgtLU6ULICd
 1gkha6UYzrABVvSQ1WDbMfDh9jqBXXMqPQxVqZIXJB29Z.aIjLx3A7HOijwc6IVVC9vmL8nOATLL
 .KKA2YdOnricxCn2sZVddy5npYD4D5.CGhu1IasCD5UOty3Sw5ZnOgZGVzOUwWOSPiUmVmPIY08s
 m63wfOx0vYpRWThNLdkMPjsZKOcIcKEyGLCY8UfwQBTOEpbqaOh_tQ9dCfNLZLiPgtlBZsMaUwo5
 ts7I.1Hu1PuhyRC8.Qx2YVQ6XgzLHAW_qMUfWo3vAtVx2MGn.ZGuZxDlp3NtHuXamddBZ52Bn7vy
 lSDexgoTbeQs27cXCH..iPyQ_ohzm3toYVsHhTJrSquyaVOizVZMfVSKBV5dR780gl0oyuJ9PBTt
 xdSYIcYDk.Zb5izX66yviyp_qEA8bhoCvZveS1VOE4bkDKR2gspCmqwaT1sgzsZNYp9m3FG4oo4Q
 wHzXBp93nwsTm.db.XaM3j.aGo7cUdd9t.2qznPibUJ_TAuOpBXoFt1u6O1.2ig6xuOPZy8MR6wO
 .izm4OucPFTgvQs0QiQ5VabmxsmG04gSbMcEFmYaG0LSB7TFLVdYFJcrd1wshEeMjzA8emfEVznO
 su9wL_1AQecPOq0wURE3Wl_NybfEzYF3fDucgH65KxtvPAamO2CMzRx..TX6iRYqSzRDTbtj2MkF
 ctQsiLxj468ZglNhHSt6YULzV0P7XVS5L78bSwLGAV78d97ZiyZp3K5XHaQeK02l.EXJDcXaKb8o
 NAkBdmGver.07NSEWahbM0rFT.Ce..w--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Thu, 20 Oct 2022 23:42:10 +0000
Received: by hermes--production-gq1-754cb59848-nlbwv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 96be409d95bde475d58f7a617539a8b3; 
 Thu, 20 Oct 2022 23:42:06 +0000 (UTC)
Message-ID: <f6b8ac05-6900-f57d-0daf-02d5ae53bc47@schaufler-ca.com>
Date: Thu, 20 Oct 2022 16:42:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v38 04/39] LSM: Maintain a table of LSM attribute data
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-5-casey@schaufler-ca.com>
 <9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: john.johansen@canonical.com, keescook@chromium.org, selinux@vger.kernel.org,
 jmorris@namei.org, linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/13/2022 3:04 AM, Tetsuo Handa wrote:
> On 2022/09/28 4:53, Casey Schaufler wrote:
>> @@ -483,6 +491,16 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
>>  {
>>  	int i;
>>  
>> +	/*
>> +	 * A security module may call security_add_hooks() more
>> +	 * than once. Landlock is one such case.
>> +	 */
>> +	if (lsm_id == 0 || lsm_idlist[lsm_id - 1] != lsmid)
>> +		lsm_idlist[lsm_id++] = lsmid;
>> +
>> +	if (lsm_id > LSMID_ENTRIES)
>> +		panic("%s Too many LSMs registered.\n", __func__);
> I'm not happy with LSMID_ENTRIES. This is a way towards forever forbidding LKM-based LSMs.

I don't see any way given the locking issues that we're ever going to
mix built in security modules and loaded security modules on the same
hook lists. The SELinux module deletion code is sufficiently scary that
it is being removed. That does not mean that I think loadable modules
are impossible, I think it means that their management is going to have
to be separate, the same way the BPF programs are handled. The only way
that I see a unified hook list is for all the LSMs to be implemented as
loadable modules, and I can't see that happening in my lifetime.

I can see an LSM like BPF, as I mentioned before, that manages loaded
modules. Over the years I've seen several designs that might work. I'm
encouraged (and not a little bit frightened) by the success of the BPF
work.

Converting the array[LSMID_ENTRIES] implementation to a hlist like the
hooks have used would not be that big a project and I don't see that
making such a change would be a show-stopper for implementing loadable
modules. I think that a lot of other issues would be more significant.

I will, on the other hand, listen to compelling arguments. It is not the
intention of this code to lock out loadable modules. If I thought it would
I would not have proposed it.

> I'm fine with using UAPI-visible constants for switching /proc/ files.
> But TOMOYO does not need such constant because TOMOYO does not use /proc/ files.
>
> Also, lsm_self_attr() will be limited for LSM modules which use /proc/ files, and
> therefore I think prctl() will be already there.

While the proposed set of attributes map to those in /proc/.../attr there is
no reason to assume they will be limited to those. I can see providing several
of the Smack attributes currently manipulated in smackfs, such as relabel-self.
If we are providing SELinux specific values like keycreate there's no reason
we can't provide Smack or TOMOYO specific values as well.

>
>> +
>>  	for (i = 0; i < count; i++) {
>>  		hooks[i].lsmid = lsmid;
>>  		hlist_add_tail_rcu(&hooks[i].list, hooks[i].head);

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

